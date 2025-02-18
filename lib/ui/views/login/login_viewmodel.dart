import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/services/snakBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool visibility = false;

  setVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  Future<void> loginNow() async {
    setBusy(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = emailCtrl.text.trim();
    String password = passwordCtrl.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      var result = await _authService.login(email, password);
      if (result == "Login Successful") {
        
        await prefs.setBool("isLoggedIn", true); // Save login state
        prefs.setString("uid", _authService.userData?.userId ?? "");
        replaceWitHomeView();
      } else {
        showErrorSnake(result);
      }
    } else {
      showErrorSnake('Please Fill all the field');
    }
    setBusy(false);
  }

  void navigateToSignup() {
    _navigationService.replaceWithSignUpView();
  }

  void navigateToReset() {
    _navigationService.navigateToResetPasswordView();
  }

  void replaceWitHomeView() {
    _navigationService.replaceWithHomeView();
  }
}
