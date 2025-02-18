import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart' show kcPrimaryColor;
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'add_notes_viewmodel.dart';

class AddNotesView extends StackedView<AddNotesViewModel> {
  const AddNotesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddNotesViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        // Save the note when the user attempts to navigate back
        await viewModel.addNote();
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
              text: 'Add ',
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
                      viewModel.addNote();
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Add',
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
                        text: 'Cancel',
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
  AddNotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddNotesViewModel();
}
