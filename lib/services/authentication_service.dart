import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/Model/authModel.dart';
import 'package:todo_app/services/extention.dart';
import 'package:todo_app/services/snakBar.dart';

class AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? authUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthModel? userData;

//------------------------LOGIN----------------------------------

  Future<String> login(String email, String password) async {
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final DocumentSnapshot snapshot =
          await firestore.collection("users").doc(user.user!.uid).get();
      Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
      userData = AuthModel.fromJson(json);
      return "Login Successful";
    } catch (e) {
      return getFirebaseExceptionMessage(e);
    }
  }

  //----------------SIGN UP-------------------------

  signUp(AuthModel? userData) async {
    try {
      if (userData == null ||
          userData.email == null ||
          userData.password == null ||
          userData.email!.isEmpty ||
          userData.password!.isEmpty) {
        showErrorSnake("Email or password cannot be empty");
        return;
      }

      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: userData.email!, password: userData.password!);
      userData.userId = user.user!.uid;

      await firestore
          .collection("users")
          .doc(user.user?.uid)
          .set(userData.toJson());

      showSucessSnake("SignUp Successfully");
      return "SignUp Successfully";
    } on FirebaseAuthException catch (e) {
      return getFirebaseExceptionMessage(e);
    } catch (e, s) {
      log(s.toString());
      return getFirebaseExceptionMessage(e);
    }
  }
}
