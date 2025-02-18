import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/models/notes_model.dart';

import 'edit_screen_viewmodel.dart';

class EditScreenView extends StackedView<EditScreenViewModel> {
  final String title;
  final String descrip;
  final NotesModel notesModel;
  const EditScreenView(
      {Key? key,
      required this.title,
      required this.descrip,
      required this.notesModel})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditScreenViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        // Save the note when the user attempts to navigate back
        await viewModel.editNote();
        // Allow the pop (navigation back) to happen
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: kcPrimaryColor,
          centerTitle: true,
          title: RichText(
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              TextFormField(
                controller: viewModel.titleController,
                decoration: InputDecoration(
                  label: RichText(
                    text: const TextSpan(
                      text: 'Enter ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              verticalSpaceMedium,
              TextFormField(
                controller: viewModel.descriptionController,
                decoration: InputDecoration(
                  label: RichText(
                    text: const TextSpan(
                      text: 'Enter ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      viewModel.editNote();
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Edit',
                        style: TextStyle(
                          color: kcPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Delete',
                        style: TextStyle(
                          color: Color.fromARGB(255, 250, 2, 2),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  EditScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditScreenViewModel(title, descrip, notesModel);
}
