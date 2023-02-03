import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> getToDoCollections();

  Future<Either<Failure, ToDoEntry>> getToDoEntry(UniqueID entryId);

  Future<Either<Failure, List<UniqueID>>> getToDoEntryIds(UniqueID collectionId);
}
