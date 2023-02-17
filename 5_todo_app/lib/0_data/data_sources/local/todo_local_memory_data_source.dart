import 'package:todo_app/0_data/data_sources/interfaces/todo_local_data_source.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

class ToDoLocalMemoryDataSource implements ToDoLocalDataSource {
  final List<ToDoCollectionModel> todoCollections = [];
  final Map<String, List<ToDoEntryModel>> todoEntries = {};

  @override
  Future<bool> creatToDoCollection(ToDoCollectionModel collection) {
    try {
      todoCollections.add(collection);
      todoEntries.putIfAbsent(collection.id, () => []);

      return Future.value(true);
    } on Exception catch (_) {
      throw CacheExceptions();
    }
  }

  @override
  Future<bool> createToDoEntry(String collectionId, ToDoEntryModel entry) {
    todoEntries[collectionId]?.add(entry);

    return Future.value(true);
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(String collectionId) {
    if (todoCollections.any((e) => e.id == collectionId)) {
      return Future.value(todoCollections.firstWhere((e) => e.id == collectionId));
    } else {
      throw CacheExceptions();
    }
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(String collectionId, String entryId) {
    if (todoEntries.containsKey(collectionId)) {
      return Future.value(todoEntries[collectionId]!.firstWhere((e) => e.id == entryId));
    } else {
      throw CacheExceptions();
    }
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry(String collectionId, String entryId) {
    if (todoEntries.containsKey(collectionId)) {
      final index = todoEntries[collectionId]!.indexWhere((e) => e.id == entryId);
      final entry = todoEntries[collectionId]![index];
      final updatedEntry = ToDoEntryModel(description: entry.description, isDone: !entry.isDone, id: entry.id);
      todoEntries[collectionId]![index] = updatedEntry;

      return Future.value(updatedEntry);
    } else {
      throw CacheExceptions();
    }
  }

  @override
  Future<List<String>> getToDoEntryIds(String collectionId) {
    if (todoEntries.containsKey(collectionId)) {
      return Future.value(todoEntries[collectionId]!.map((e) => e.id).toList());
    } else {
      throw CacheExceptions();
    }
  }

  @override
  Future<List<ToDoCollectionModel>> getToDoCollections() {
    return Future.value(todoCollections);
  }
}
