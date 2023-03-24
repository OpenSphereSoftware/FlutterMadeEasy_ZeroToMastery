import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class ToDoEntryIdsParam extends Params {
  ToDoEntryIdsParam({
    required this.collectionId,
    required this.entryId,
  }) : super();

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId, entryId];
}

class CollectionIdParam extends Params {
  CollectionIdParam({
    required this.collectionId,
  }) : super();

  final CollectionId collectionId;

  @override
  List<Object> get props => [collectionId];
}

class ToDoCollectionParams extends Params {
  ToDoCollectionParams({
    required this.collection,
  }) : super();

  final ToDoCollection collection;

  @override
  List<Object> get props => [collection];
}

class ToDoEntryParams extends Params {
  ToDoEntryParams({
    required this.entry,
    required this.collectionId,
  }) : super();

  final ToDoEntry entry;
  final CollectionId collectionId;

  @override
  List<Object> get props => [entry, collectionId];
}
