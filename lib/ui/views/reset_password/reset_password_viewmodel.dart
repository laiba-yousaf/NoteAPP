import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';

class ResetPasswordViewModel extends BaseViewModel {
   TextEditingController nameController = TextEditingController();

  final _navigationService = locator<NavigationService>();

  void navigateToLogin() {
    _navigationService.navigateToLoginView();
  }
}
