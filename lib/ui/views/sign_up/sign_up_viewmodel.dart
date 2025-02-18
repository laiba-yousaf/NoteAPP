import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/Model/authModel.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/authentication_service.dart';
import 'package:todo_app/services/snakBar.dart';

class SignUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController cPasswordCtrl = TextEditingController();
  final _authService = locator<AuthenticationService>();

  bool visibility = false;
  bool cVisibility = false;

  setVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  setCVisibility() {
    cVisibility = !cVisibility;
    notifyListeners();
  }

  Future<void> signUpNow() async {
    setBusy(true);

    String email = emailCtrl.text.trim();
    String name = nameCtrl.text.trim();
    String password = passwordCtrl.text.trim();
    String cPassword = cPasswordCtrl.text.trim();
    if (password == cPassword && name.isNotEmpty) {
      AuthModel userData = AuthModel(
          email: email,
          name: name,
          password: password,
          confirmPassword: cPassword);
      var result = await _authService.signUp(userData);

      if (result == "SignUp Successfully") {
        _navigationService.replaceWithLoginView();
      } else {
        showErrorSnake(result);
      }
    } else {
      showErrorSnake("Password don't match");
    }

    setBusy(false);
  }

  void navigateToReset() {
    _navigationService.navigateToResetPasswordView();
  }

  

  void replaceWithLoginView() {
    _navigationService.replaceWithLoginView();
  }
}
