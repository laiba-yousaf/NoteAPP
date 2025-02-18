import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/firestore_service_service.dart'
    show FirestoreServiceService;
import 'package:todo_app/ui/models/notes_model.dart';

class AddNotesViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final FirestoreServiceService _firestoreService =
      FirestoreServiceService(); // Firestore Service

  Future<void> addNote() async {
    final title = titleController.text;
    final description = descriptionController.text;

    if (title.isEmpty && description.isEmpty) {
      // If both fields are empty, do not save the note
      return;
    }

    final data = NotesModel(
      id: '',
      title: title,
      description: description,
      mapValue: {}, // Optional Map
    );

    await _firestoreService.addNote(data);

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
