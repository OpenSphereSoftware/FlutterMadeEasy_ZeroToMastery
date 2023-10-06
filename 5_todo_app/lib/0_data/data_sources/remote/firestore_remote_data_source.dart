import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_remote_data_source_interface.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';

class FirestoreRemoteDataSource implements ToDoRemoteDataSourceInterface {
  @override
  Future<bool> createToDoCollection({
    required String userId,
    required ToDoCollectionModel collection,
  }) async {
    return FirebaseFirestore.instance
        .collection(userId)
        .doc(collection.id)
        .set(collection.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> createToDoEntry({
    required String userId,
    required String collectionId,
    required ToDoEntryModel entry,
  }) async {
    return FirebaseFirestore.instance
        .collection(userId)
        .doc(collectionId)
        .collection('todo-entries')
        .doc(entry.id)
        .set(entry.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection({
    required String userId,
    required String collectionId,
  }) async {
    final docSnapshot = await FirebaseFirestore.instance.collection(userId).doc(collectionId).get();

    if (docSnapshot.exists || docSnapshot.data() != null) {
      final result = ToDoCollectionModel.fromJson(docSnapshot.data()!);

      return result;
    } else {
      throw FirestoreCollectionNotFoundException(id: collectionId);
    }
  }

  @override
  Future<List<String>> getToDoCollectionIds({required String userId}) async {
    final querySnapshot = await FirebaseFirestore.instance.collection(userId).get();

    final result = querySnapshot.docs.map((doc) => doc.id).toList();

    return result;
  }

  @override
  Future<ToDoEntryModel> getToDoEntry({
    required String userId,
    required String collectionId,
    required String entryId,
  }) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection(userId)
        .doc(collectionId)
        .collection('todo-entries')
        .doc(entryId)
        .get();

    if (docSnapshot.exists || docSnapshot.data() != null) {
      final result = ToDoEntryModel.fromJson(docSnapshot.data()!);

      return result;
    } else {
      throw FirestoreEntryNotFoundException(
        id: entryId,
        collectionId: collectionId,
      );
    }
  }

  @override
  Future<List<String>> getToDoEntryIds({
    required String userId,
    required String collectionId,
  }) async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection(userId).doc(collectionId).collection('todo-entries').get();

    final result = querySnapshot.docs.map((doc) => doc.id).toList();

    return result;
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry({
    required String userId,
    required String collectionId,
    required ToDoEntryModel entry,
  }) async {
    await FirebaseFirestore.instance
        .collection(userId)
        .doc(collectionId)
        .collection('todo-entries')
        .doc(entry.id)
        .set(entry.toJson(), SetOptions(merge: true));

    return entry;
  }
}
