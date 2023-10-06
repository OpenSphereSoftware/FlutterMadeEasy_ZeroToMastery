import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

abstract class ToDoRemoteDataSourceInterface {
  Future<ToDoEntryModel> getToDoEntry({
    required String userId,
    required String collectionId,
    required String entryId,
  });

  Future<List<String>> getToDoEntryIds({
    required String userId,
    required String collectionId,
  });

  Future<ToDoCollectionModel> getToDoCollection({
    required String userId,
    required String collectionId,
  });

  Future<List<String>> getToDoCollectionIds({required String userId});

  Future<bool> createToDoEntry({
    required String userId,
    required String collectionId,
    required ToDoEntryModel entry,
  });

  Future<bool> createToDoCollection({
    required String userId,
    required ToDoCollectionModel collection,
  });

  Future<ToDoEntryModel> updateToDoEntry({
    required String userId,
    required String collectionId,
    required ToDoEntryModel entry,
  });
}
