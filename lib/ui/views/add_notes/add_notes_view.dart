import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart' show kcPrimaryColor;
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/common/button/button.dart';
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
                        text: 'Enter',
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
                      borderSide: const BorderSide(
                          color: kcPrimaryColor,
                          width: 1.5), // Default border color
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
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kcPrimaryColor, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          color: kcPrimaryColor,
                          width: 1.5), // Default border color
                    ), // Border color
                  ),
                  maxLines: 3,
                ),
                verticalSpaceMedium,
                if (viewModel.selectedImage != null)
                  Image.file(viewModel.selectedImage!,
                      height: 100, width: 100, fit: BoxFit.cover),
                ElevatedButton(
                    onPressed: viewModel.pickImage,
                    child: const Text("Pick Image")),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.mic,
                          color: viewModel.isRecording
                              ? Colors.red
                              : Colors.black),
                      onPressed: viewModel.isRecording
                          ? viewModel.stopRecording
                          : viewModel.startRecording,
                    ),
                    // Line or Waveform
                    Expanded(
                      child: Container(
                        height: 2,
                        color: viewModel.isRecording
                            ? Colors.red
                            : Colors.grey, // Line color changes while recording
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),

                    Text(
                      '${(viewModel.seconds ~/ 60).toString().padLeft(2, '0')}:${(viewModel.seconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceSmall,
                    IconButton(
                      icon: Icon(
                        viewModel.isPlaying ? Icons.stop : Icons.play_arrow,
                        color: kcPrimaryColor,
                      ),
                      onPressed: () {
                        viewModel.isPlaying
                            ? viewModel.stopAudio()
                            : viewModel.playAudio();
                      },
                    ),
                  ],
                ),
                verticalSpaceLarge,
                verticalSpaceMedium,
                Button(
                  title: "Add",
                  onTap: () {
                    viewModel.addNote();
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
  AddNotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddNotesViewModel();
}
