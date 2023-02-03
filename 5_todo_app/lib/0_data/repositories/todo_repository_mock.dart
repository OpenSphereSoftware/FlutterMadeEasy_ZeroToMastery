import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryMock implements ToDoRepository {
  @override
  Future<Either<Failure, List<ToDoCollection>>> getToDoCollections() {
    final list = List<ToDoCollection>.from(todoCollections);
    return Future.delayed(const Duration(milliseconds: 250), () => Right(list));
  }

  @override
  Future<Either<Failure, ToDoEntry>> getToDoEntry(UniqueID entryId) {
    try {
      final list = List<ToDoEntry>.from(todoEntries);
      final item = list.firstWhere((element) => element.id == entryId);
      return Future.delayed(const Duration(milliseconds: 250), () => Right(item));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<UniqueID>>> getToDoEntryIds(UniqueID collectionId) {
    try {
      final list = todoEntries.map((entry) => entry.id).toList();
      list.shuffle(); // shuffle list to get different results each time
      final randomIds = list.sublist(0, 10); // every id has only ten entries
      return Future.delayed(const Duration(milliseconds: 250), () => Right(randomIds));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(UniqueID entryId) {
    final index = todoEntries.indexWhere((element) => element.id == entryId);
    final updatedEntry = todoEntries[index].copyWith(isDone: !todoEntries[index].isDone);
    todoEntries[index] = updatedEntry;

    return Future.delayed(const Duration(milliseconds: 250), () => Right(updatedEntry));
  }

  @override
  Future<Either<Failure, bool>> addToDoCollection(ToDoCollection collection) {
    todoCollections.add(collection);
    return Future.delayed(const Duration(milliseconds: 250), () => const Right(true));
  }

  @override
  Future<Either<Failure, bool>> addToDoEntry(ToDoEntry entry) {
    todoEntries.add(entry);
    return Future.delayed(const Duration(milliseconds: 250), () => const Right(true));
  }

  final List<ToDoCollection> todoCollections = List.generate(
    100,
    (index) => ToDoCollection.empty().copyWith(
      title: 'index $index',
      color: TodoColor(
        color: TodoColor.predefinedColors[index % 5],
      ),
    ),
  );

  final List<ToDoEntry> todoEntries = List.generate(
    100,
    (index) => ToDoEntry(
      id: UniqueID.fromUniqueString(index.toString()),
      description: 'description $index',
      isDone: false,
    ),
  );
}
