import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';

import 'edit_dialog_model.dart';

class EditDialog extends StackedView<EditDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditDialogModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          RichText(
            text: const TextSpan(
              text: 'Edit ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Notes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container()
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: viewModel.titleController,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(
                  text: 'Title',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: viewModel.descriptionController,
            decoration: InputDecoration(
              label: RichText(
                text: const TextSpan(
                  text: 'Description',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              border: const OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          verticalSpaceMedium,
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await viewModel.editNote();
            Navigator.pop(context);
          },
          child: RichText(
            text: const TextSpan(
              text: 'Edit',
              style: TextStyle(
                color: kcSecondaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await viewModel.deleteNote();
            Navigator.pop(context);
          },
          child: RichText(
            text: const TextSpan(
              text: 'Delete',
              style: TextStyle(
                color: Color.fromARGB(255, 248, 16, 16),
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  EditDialogModel viewModelBuilder(BuildContext context) => EditDialogModel(
        request.data['title'],
        request.data['descrip'],
        request.data['notesModel'],
      );
}
