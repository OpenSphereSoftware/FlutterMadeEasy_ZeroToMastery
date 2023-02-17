import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryMock implements ToDoRepository {
  final List<ToDoCollection> todoCollections = List.generate(
    10,
    (index) => ToDoCollection(
      id: CollectionId.fromUniqueString(index.toString()),
      title: 'index $index',
      color: ToDoColor(
        colorIndex: index % ToDoColor.predefinedColors.length,
      ),
    ),
  );

  final List<ToDoEntry> todoEntries = List.generate(
    100,
    (index) => ToDoEntry(
      id: EntryId.fromUniqueString(index.toString()),
      description: 'description $index',
      isDone: false,
    ),
  );

  @override
  Future<Either<Failure, bool>> createToDoCollection(ToDoCollection collection) {
    todoCollections.add(collection);
    return Future.delayed(const Duration(milliseconds: 250), () => const Right(true));
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(CollectionId collectionId, ToDoEntry entry) {
    todoEntries.add(entry);
    return Future.delayed(const Duration(milliseconds: 250), () => const Right(true));
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    final list = List<ToDoCollection>.from(todoCollections);
    return Future.delayed(const Duration(milliseconds: 250), () => Right(list));
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) {
    try {
      final list = List<ToDoEntry>.from(todoEntries);
      final item = list.firstWhere((element) => element.id == entryId);
      return Future.delayed(const Duration(milliseconds: 250), () => Right(item));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryIds = todoEntries.sublist(startIndex, endIndex).map((entry) => entry.id).toList();

      return Future.delayed(const Duration(milliseconds: 250), () => Right(entryIds));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(CollectionId collectionId, EntryId entryId) {
    final index = todoEntries.indexWhere((element) => element.id == entryId);
    final updatedEntry = todoEntries[index].copyWith(isDone: !todoEntries[index].isDone);
    todoEntries[index] = updatedEntry;

    return Future.delayed(const Duration(milliseconds: 250), () => Right(updatedEntry));
  }
}
