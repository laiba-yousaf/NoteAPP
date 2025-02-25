import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/app_image.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/common/button/button.dart';
import 'package:todo_app/ui/widgets/common/textfield/textfield.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
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
                  verticalSpaceMedium,
                  verticalSpaceLarge,
                  const Image(
                    image: AssetImage(logo,),
                    width: 100,
                    height: 100,
                  ),
                  verticalSpaceLarge,
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: kcPrimaryColor),
                  ),
                  const Text(
                    "Welcome to Note APP",
                    style: TextStyle(fontSize: 14, color: kcLightGrey),
                  ),
                  verticalSpaceMedium,
                  Textfield(
                    title: "Email",
                    ctrl: viewModel.emailCtrl,
                  ),
                  verticalSpaceSmall,
                  Textfield(
                    title: "Name",
                    ctrl: viewModel.nameCtrl,
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
                  verticalSpaceSmall,
                  Textfield(
                      title: "Confirm Password",
                      ctrl: viewModel.cPasswordCtrl,
                      obscureText: !viewModel.cVisibility,
                      sufixIcon: GestureDetector(
                          onTap: viewModel.setCVisibility,
                          child: Icon(viewModel.cVisibility
                              ? Icons.visibility
                              : Icons.visibility_off))),

                  verticalSpaceLarge,
                  Button(
                    title: "Sign up",
                    onTap: viewModel.signUpNow,
                    color: kcPrimaryColor,
                    borderStatus: true,

                  ),
                  verticalSpaceMedium,
                  TextButton(
                    onPressed: viewModel.replaceWithLoginView,
                    child: const Text(
                      "Already have an account",
                      style: TextStyle(color: kcPrimaryColor,fontWeight:FontWeight.w800,),
                        
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
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
