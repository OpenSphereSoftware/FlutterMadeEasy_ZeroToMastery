import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case/use_case.dart';

class LoadOverviewCollections implements UseCase<void, NoParams> {
  const LoadOverviewCollections({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<TodoCollection>>> call(NoParams params) async {
    try {
      final loadedCollection = toDoRepository.getToDoCollections();

      return loadedCollection.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
