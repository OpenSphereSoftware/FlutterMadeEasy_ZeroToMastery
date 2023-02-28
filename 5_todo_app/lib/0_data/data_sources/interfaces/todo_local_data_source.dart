import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

abstract class ToDoLocalDataSource {
  /// Throws [CacheException] if no cached data is present.
  Future<ToDoEntryModel> getToDoEntry(String collectionId, String entryId);

  /// Throws [CacheException] if no cached data is present.
  Future<List<String>> getToDoEntryIds(String collectionId);

  /// Throws [CacheException] if no cached data is present.
  Future<ToDoCollectionModel> getToDoCollection(String collectionId);

  /// Throws [CacheException] if no cached data is present.
  Future<List<ToDoCollectionModel>> getToDoCollections();

  Future<bool> createToDoEntry(String collectionId, ToDoEntryModel entry);

  Future<bool> creatToDoCollection(ToDoCollectionModel collection);

  Future<ToDoEntryModel> updateToDoEntry(String collectionId, String entryId);
}
