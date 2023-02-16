import '../models/todo_collection_model.dart';
import '../models/todo_entry_model.dart';

abstract class ToDoRemoteDataSource {
  /// Throws [ServerException] if no cached data is present.
  Future<ToDoEntryModel> getToDoEntry(String entryId);

  /// Throws [ServerException] if no cached data is present.
  Future<ToDoCollectionModel> getToDoCollection(String collectionId);

  Future<bool> createToDoEntry(ToDoEntryModel entry);

  Future<bool> creatToDoCollection(ToDoCollectionModel collection);

  Future<bool> updateToDoEntry(ToDoEntryModel entry);
}

class ToDoRemoteFirebaseDataSource extends ToDoRemoteDataSource {
  @override
  Future<bool> creatToDoCollection(ToDoCollectionModel collection) {
    // TODO: implement creatToDoCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> createToDoEntry(ToDoEntryModel entry) {
    // TODO: implement createToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(String collectionId) {
    // TODO: implement getToDoCollection
    throw UnimplementedError();
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(String entryId) {
    // TODO: implement getToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<bool> updateToDoEntry(ToDoEntryModel entry) {
    // TODO: implement updateToDoEntry
    throw UnimplementedError();
  }
}
