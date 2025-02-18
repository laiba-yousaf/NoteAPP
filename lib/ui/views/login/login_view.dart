import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/app_image.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/common/button/button.dart';
import 'package:todo_app/ui/widgets/common/textfield/textfield.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  const Image(
                    image: AssetImage(logo),
                    width: 100,
                    height: 100,
                  ),
                  verticalSpaceSmall,
                  const Text(
                    "Welcome to NOTE APP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kcPrimaryColor),
                  ),
                  const Text(
                    "Log In to continue",
                    style: TextStyle(fontSize: 14, color: kcLightGrey),
                  ),
                  verticalSpaceMedium,
                  Textfield(
                    title: "Email",
                    ctrl: viewModel.emailCtrl,
                  ),
                  verticalSpaceSmall,
                  Textfield(
                      title: "Password",
                      ctrl: viewModel.passwordCtrl,
                      obscureText: !viewModel.visibility,
                      sufixIcon: GestureDetector(
                          onTap: viewModel.setVisibility,
                          child: Icon(viewModel.visibility
                              ? Icons.visibility
                              : Icons.visibility_off))),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                           viewModel.navigateToReset();
                        },
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(color: kcPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Button(
                    title: "Login",
                    onTap: viewModel.loginNow,
                    color: kcPrimaryColor,
                    borderStatus: true,
                  ),
                  verticalSpaceMedium,
                  TextButton(
                    onPressed: 
                    viewModel.navigateToSignup,
                    child: const Text(
                      "Create new account",
                      style: TextStyle(color: kcPrimaryColor),
                    ),
                  ),
                  // verticalSpaceLarge,
                  // const SocialButton()
                ],
              ),
            ),
          ),
          if (viewModel.isBusy)
            const Center(
              child: CupertinoActivityIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
