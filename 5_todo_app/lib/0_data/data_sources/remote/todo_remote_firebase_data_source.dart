
import 'package:todo_app/0_data/data_sources/interfaces/todo_remote_data_source.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

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
