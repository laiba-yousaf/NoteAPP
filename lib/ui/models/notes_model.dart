class NotesModel {
  String id; // Firestore document ID
  String title;
  String description;
  int? intValue;
  Map<String, dynamic>? mapValue;

  NotesModel({
    required this.id,
    required this.title,
    required this.description,
    this.intValue,
    this.mapValue,
  });

  // Convert Firestore DocumentSnapshot to NotesModel
  factory NotesModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return NotesModel(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      intValue: data['intValue'] as int?,
      mapValue: data['mapValue'] as Map<String, dynamic>?,
    );
  }

  // Convert NotesModel to Firestore Map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'intValue': intValue,
      'mapValue': mapValue,
    };
  }
}
