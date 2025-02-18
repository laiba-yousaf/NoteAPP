import 'package:stacked/stacked.dart';
import 'package:todo_app/services/firestore_service_service.dart'
    show FirestoreServiceService;
import 'package:todo_app/ui/models/notes_model.dart';

class DeleteDialogModel extends BaseViewModel {
  final NotesModel notesModel;
  final String title;

  // Create an instance of your Firestore service
  final FirestoreServiceService _firestoreService = FirestoreServiceService();

  DeleteDialogModel(this.notesModel, this.title);

  /// Deletes the note using Firestore
  Future<void> delete() async {
    await _firestoreService.deleteNote(notesModel.id);
  }
}
