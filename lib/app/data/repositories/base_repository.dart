import 'package:cloud_firestore/cloud_firestore.dart';

class BaseRepository<T> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath;
  final T Function(Map<String, dynamic>) fromJson;

  BaseRepository({required this.collectionPath, required this.fromJson});

  Future<void> add(String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionPath).doc(id).set(data);
    } catch (e) {
      throw Exception("Failed to add data: $e");
    }
  }
}
