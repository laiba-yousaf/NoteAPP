import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';

import 'button_model.dart';

class Button extends StackedView<ButtonModel> {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color? color;
  final bool borderStatus;
  final double? width;
  final double? height;
  final double? padding;

  const Button({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    required this.borderStatus,
    this.loading = false,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget builder(
    BuildContext context,
    ButtonModel viewModel,
    Widget? child,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: padding ?? 30, right: padding ?? 30),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? 45,
          width: width ?? screenWidth(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: borderStatus ? color : null,
              border: borderStatus ? null : Border.all(color: color!)),
          child: Center(
            child: loading
                ? const CupertinoActivityIndicator()
                : Text(
                    title,
                    style: TextStyle(
                        color: borderStatus ? Colors.white : kcPrimaryColor),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  ButtonModel viewModelBuilder(BuildContext context) => ButtonModel();
}
