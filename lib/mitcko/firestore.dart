import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //6. get collection of note
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');
  //7. CREATE
  Future<void> addNote(String note) {
    return notes.add({'note': note, 'timestamp': Timestamp.now()});
  }

  // 8. READ
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //10. UPDATE
  Future<void> updateNote(String docID, String newNote) {
    return notes
        .doc(docID)
        .update({'note': newNote, 'timestamp': Timestamp.now()});
  }
  //DELETE

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
