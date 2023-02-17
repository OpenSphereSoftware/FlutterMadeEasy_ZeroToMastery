import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case/use_case.dart';

class AddToDoEntry implements UseCase<void, ToDoEntryParams> {
  const AddToDoEntry({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, bool>> call(ToDoEntryParams params) async {
    try {
      final addedCollection = toDoRepository.createToDoEntry(
        params.collectionId,
        params.entry,
      );

      return addedCollection.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
