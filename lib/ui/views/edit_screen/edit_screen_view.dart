import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/models/notes_model.dart';
import 'package:todo_app/ui/widgets/common/button/button.dart';

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
        await viewModel.editNote();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
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
                          enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color:kcPrimaryColor, width: 1.5), // Default border color
                ),
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
                          enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color:kcPrimaryColor, width: 1.5), // Default border color
                ),
                  ),
                  maxLines: 3,
                ),
                 verticalSpaceLarge,
                verticalSpaceMedium,
                Button(
                  title: "Edit",
                  onTap: () {
                    viewModel.editNote();
                    Navigator.pop(context);
                  },
                  color: kcPrimaryColor,
                  borderStatus: true,
                ),
                verticalSpaceSmall,
                Button(
                  title: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: kcPrimaryColor,
                  borderStatus: false,
                ),
              
              ],
            ),
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
