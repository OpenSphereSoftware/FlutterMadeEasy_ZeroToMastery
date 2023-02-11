import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryMemory implements ToDoRepository {
  final List<ToDoCollection> todoCollections = [];
  final Map<UniqueID, List<ToDoEntry>> todoEntries = {};

  @override
  Future<Either<Failure, bool>> createToDoCollection(ToDoCollection collection) {
    todoCollections.add(collection);
    todoEntries.putIfAbsent(collection.id, () => []);

    return Future.value(const Right(true));
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(CollectionId collectionId, ToDoEntry entry) {
    todoEntries[collectionId]?.add(entry);

    return Future.value(const Right(true));
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    return Future.value(Right(todoCollections));
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) {
    if (todoEntries.containsKey(collectionId)) {
      return Future.value(Right(todoEntries[collectionId]!.firstWhere((e) => e.id == entryId)));
    } else {
      return Future.value(Left(GeneralFailure()));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) {
    return Future.value(Right(todoEntries[collectionId]?.map((e) => e.id).toList() ?? []));
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(CollectionId collectionId, EntryId entryId) {
    if (todoEntries.containsKey(collectionId)) {
      final index = todoEntries[collectionId]!.indexWhere((e) => e.id == entryId);
      final entry = todoEntries[collectionId]![index];
      final updatedEntry = entry.copyWith(isDone: !entry.isDone);

      todoEntries[collectionId]![index] = updatedEntry;

      return Future.value(Right(updatedEntry));
    } else {
      return Future.value(Left(GeneralFailure()));
    }
  }
}
