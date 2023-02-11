import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case/use_case.dart';

class AddToDoCollection implements UseCase<void, ToDoCollectionParams> {
  const AddToDoCollection({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, bool>> call(ToDoCollectionParams params) async {
    try {
      final addedEntry = toDoRepository.createToDoCollection(params.collection);

      return addedEntry.fold(
            (left) => Left(left),
            (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
