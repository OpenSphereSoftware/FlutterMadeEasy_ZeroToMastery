import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case/use_case.dart';

class LoadToDoEntriesForCollection implements UseCase<void, IdParams> {
  const LoadToDoEntriesForCollection({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<UniqueID>>> call(IdParams params) async {
    try {
      final loadedIds = toDoRepository.getToDoEntryIds(params.id);

      return loadedIds.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}