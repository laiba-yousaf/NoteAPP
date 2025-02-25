import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import 'textfield_model.dart';

class Textfield extends StackedView<TextfieldModel> {
  final Widget? sufixIcon;
  final bool? obscureText;
  final String? title;
  final String? borderTitle;
  final InputBorder? border;
  final int? maxLines;
  final TextEditingController? ctrl;
  final TextInputType? keyboardType;
  const Textfield({
    super.key,
    this.title,
    this.ctrl,
    this.obscureText,
    this.sufixIcon,
    this.border,
    this.borderTitle,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget builder(
    BuildContext context,
    TextfieldModel viewModel,
    Widget? child,
  ) {
    return Container(
      decoration: BoxDecoration(
       // color: borderTitle == null ? kcPrimaryColor : null,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: kcPrimaryColor)
      ),
      child: ctrl != null
          ? TextFormField(
              obscureText: obscureText ?? false,
              controller: ctrl,
              maxLines: maxLines ?? 1,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: title,
                labelText: borderTitle,
                hintStyle: const TextStyle(fontSize: 14),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                border: border ?? InputBorder.none,
                alignLabelWithHint: true,
                suffixIcon: sufixIcon,
              ),
            )
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title ?? ""),
                )
              ],
            ),
    );
  }

  @override
  TextfieldModel viewModelBuilder(
    BuildContext context,
  ) =>
      TextfieldModel();
}
