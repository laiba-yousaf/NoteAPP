import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/services/firestore_service_service.dart'
    show FirestoreServiceService;
import 'package:todo_app/ui/models/notes_model.dart';

class EditScreenViewModel extends BaseViewModel {
  final String title;
  final String descrip;
  final NotesModel notesModel;

  // Create an instance of your Firestore service
  final FirestoreServiceService _firestoreService = FirestoreServiceService();

  TextEditingController titleController;
  TextEditingController descriptionController;

  EditScreenViewModel(this.title, this.descrip, this.notesModel)
      : titleController = TextEditingController(text: title),
        descriptionController = TextEditingController(text: descrip);

  /// Updates the note using Firestore
  Future<void> editNote() async {
    notesModel.title = titleController.text;
    notesModel.description = descriptionController.text;
    await _firestoreService.updateNote(notesModel);
    clearFields();
  }

  /// Deletes the note using Firestore
  Future<void> deleteNote() async {
    await _firestoreService.deleteNote(notesModel.id);
    clearFields();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
