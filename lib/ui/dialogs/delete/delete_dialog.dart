import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'delete_dialog_model.dart';

class DeleteDialog extends StackedView<DeleteDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 50,
            ),
            verticalSpaceMedium,
            const Text(
              "Delete Note?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kcDarkGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            const Text(
              "Are you sure you want to delete this note?",
              style: TextStyle(
                fontSize: 18,
                color: kcMediumGrey,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Text(
              viewModel.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kcPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: kcPrimaryColor),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: kcDarkGreyColor),
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await viewModel.delete();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: kcDarkGreyColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  DeleteDialogModel viewModelBuilder(BuildContext context) =>
      DeleteDialogModel(request.data['notesModel'], request.data['title']);
}
