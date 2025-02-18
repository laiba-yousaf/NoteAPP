import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/ui/models/notes_model.dart';

class FirestoreServiceService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Create Note
  Future<void> addNote(NotesModel note) async {
    await notesCollection.add(note.toFirestore());
  }

  // Read Notes (Stream)
  Stream<List<NotesModel>> getNotes() {
    return notesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return NotesModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Update Note
  Future<void> updateNote(NotesModel note) async {
    await notesCollection.doc(note.id).update(note.toFirestore());
  }

  // Delete Note
  Future<void> deleteNote(String noteId) async {
    await notesCollection.doc(noteId).delete();
  }
}
