import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<String?> uploadImage(File imageUrl) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref =
          FirebaseStorage.instance.ref().child("images/$fileName.jpg");
      UploadTask uploadTask = ref.putFile(imageUrl);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print(
        'Error uploading image:$e',
      );
      return null;
    }
  }

  Future<String?> uploadAudio(File audioFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref =
          FirebaseStorage.instance.ref().child('audio/$fileName.mp3');
      UploadTask uploadTask = ref.putFile(audioFile);

      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error uploading audio: $e");
      return null;
    }
  }
}
