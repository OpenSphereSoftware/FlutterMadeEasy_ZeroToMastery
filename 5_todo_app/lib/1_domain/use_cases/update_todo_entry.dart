import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case/use_case.dart';

class UpdateToDoEntry implements UseCase<void, IdParams> {
  const UpdateToDoEntry({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(IdParams params) async {
    try {
      final loadedEntry = toDoRepository.updateToDoEntry(params.id);

      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}