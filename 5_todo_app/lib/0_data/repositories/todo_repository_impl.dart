import 'package:either_dart/either.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_local_data_source.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_remote_data_source.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  final ToDoLocalDataSource localDataSource;
  final ToDoRemoteDataSource remoteDataSource;

  ToDoRepositoryImpl({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> createToDoCollection(ToDoCollection collection) async {
    try {
      final result = await localDataSource.creatToDoCollection(toDoCollectionToDto(collection));

      return Future.value(Right(result));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(CollectionId collectionId, ToDoEntry entry) async {
    try {
      final result = await localDataSource.createToDoEntry(collectionId.value, toDoEntryToDto(entry));
      return Future.value(Right(result));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() async {
    try {
      final collections = await localDataSource.getToDoCollections();
      return Future.value(Right(collections.map((collection) => toDoCollectionModelToEntity(collection)).toList()));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) async {
    try {
      final entry = await localDataSource.getToDoEntry(collectionId.value, entryId.value);
      return Future.delayed(const Duration(milliseconds: 250), () => Right(toDoEntryModelToEntity(entry)));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) async {
    try {
      final entries = await localDataSource.getToDoEntryIds(collectionId.value);
      return Future.value(Right(entries.map((id) => EntryId.fromUniqueString(id)).toList()));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(CollectionId collectionId, EntryId entryId) async {
    try {
      final entry = await localDataSource.updateToDoEntry(collectionId.value, entryId.value);
      return Future.value(Right(toDoEntryModelToEntity(entry)));
    } on CacheExceptions catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  ToDoCollectionModel toDoCollectionToDto(ToDoCollection entity) {
    final model = ToDoCollectionModel(
      id: entity.id.value,
      title: entity.title,
      colorIndex: entity.color.colorIndex,
    );
    return model;
  }

  ToDoCollection toDoCollectionModelToEntity(ToDoCollectionModel dto) {
    final entity = ToDoCollection(
      id: CollectionId.fromUniqueString(dto.id),
      title: dto.title,
      color: ToDoColor(colorIndex: dto.colorIndex),
    );

    return entity;
  }

  ToDoEntryModel toDoEntryToDto(ToDoEntry entity) {
    final model = ToDoEntryModel(
      id: entity.id.value,
      description: entity.description,
      isDone: entity.isDone,
    );
    return model;
  }

  ToDoEntry toDoEntryModelToEntity(ToDoEntryModel dto) {
    final entity = ToDoEntry(
      id: EntryId.fromUniqueString(dto.id),
      description: dto.description,
      isDone: dto.isDone,
    );

    return entity;
  }
}
