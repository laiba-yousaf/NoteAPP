class NotesModel {
  String id; // Firestore document ID
  String title;
  String description;
  int? intValue;
  String? audioUrl;
  String? imageUrl;


  NotesModel({
    required this.id,
    required this.title,
    required this.description,
    this.intValue,
    this.audioUrl,
    this.imageUrl
  });

  // Convert Firestore DocumentSnapshot to NotesModel
  factory NotesModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return NotesModel(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      intValue: data['intValue'] as int?,
      audioUrl: data['audioUrl'] as String ,
      imageUrl: data['imageUrl'] as String
    );
  }

  // Convert NotesModel to Firestore Map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'intValue': intValue,
      'audioUrl':audioUrl,
      'imageUrl':imageUrl
    };
  }
}
