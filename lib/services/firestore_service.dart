import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  factory FirestoreService() {
    return instance;
  }

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    var reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();

    return snapshots.map(
      (snapshot) => snapshot.docs.map(
        (snapshot) {
          final data = snapshot.data();
          return builder(data, snapshot.id);
        },
      ).toList(),
    );
  }
}
