import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

abstract class ToDoLocalDataSourceInterface {
  Future<ToDoEntryModel> getToDoEntry({
    required String collectionId,
    required String entryId,
  });

  Future<List<String>> getToDoEntryIds({required String collectionId});

  Future<ToDoCollectionModel> getToDoCollection({required String collectionId});

  Future<List<String>> getToDoCollectionIds();

  Future<bool> createToDoEntry({required String collectionId, required ToDoEntryModel entry});

  Future<bool> createToDoCollection({required ToDoCollectionModel collection});

  Future<ToDoEntryModel> updateToDoEntry({
    required String collectionId,
    required String entryId,
  });
}
