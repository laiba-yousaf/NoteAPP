import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/common/button/button.dart';
import 'package:todo_app/ui/widgets/common/textfield/textfield.dart';

import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpaceMedium,
          verticalSpaceLarge,
          const Text(
            "Reset Password",
            style: TextStyle(
                fontSize: 24, color: kcLightGrey, fontWeight: FontWeight.bold),
          ),
          verticalSpaceSmall,
          const Text(
            "please enter your email to receive a link to \n      create a new password via email",
            style: TextStyle(fontSize: 14, color: kcLightGrey),
          ),
          verticalSpaceLarge,
          Textfield(
            title: "Email address",
            ctrl: viewModel.nameController,
          ),
          verticalSpaceMedium,
          Button(
            title: "Send",
            onTap: () {},
            color: kcPrimaryColor,
            borderStatus: true,
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an Account?",
                style: TextStyle(color: kcLightGrey),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: kcPrimaryColor),
                  ))
            ],
          )
        ],
      ),
    ));
  }

  @override
  ResetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResetPasswordViewModel();
}
