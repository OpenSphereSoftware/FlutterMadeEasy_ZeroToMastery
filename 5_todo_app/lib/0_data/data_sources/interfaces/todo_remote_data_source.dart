import '../../models/todo_collection_model.dart';
import '../../models/todo_entry_model.dart';

abstract class ToDoRemoteDataSource {
  /// Throws [ServerException] if no cached data is present.
  Future<ToDoEntryModel> getToDoEntry(String entryId);

  /// Throws [ServerException] if no cached data is present.
  Future<ToDoCollectionModel> getToDoCollection(String collectionId);

  Future<bool> createToDoEntry(ToDoEntryModel entry);

  Future<bool> creatToDoCollection(ToDoCollectionModel collection);

  Future<bool> updateToDoEntry(ToDoEntryModel entry);
}
