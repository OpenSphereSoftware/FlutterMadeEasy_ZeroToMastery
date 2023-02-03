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

class IdParams extends Params {
  IdParams({required this.id}) : super();

  final UniqueID id;

  @override
  List<Object?> get props => [id];
}

class ToDoEntryParams extends Params {
  ToDoEntryParams({required this.entry}) : super();

  final ToDoEntry entry;

  @override
  List<Object?> get props => [entry];
}

class ToDoCollectionParams extends Params {
  ToDoCollectionParams({required this.collection}) : super();

  final ToDoCollection collection;

  @override
  List<Object?> get props => [collection];
}
