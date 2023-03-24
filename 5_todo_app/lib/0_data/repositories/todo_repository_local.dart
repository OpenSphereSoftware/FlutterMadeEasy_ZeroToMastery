import 'package:todo_app/0_data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryLocal extends ToDoRepository {
  final ToDoLocalDataSourceInterface localDataSource;

  ToDoRepositoryLocal({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> createToDoCollection(ToDoCollection collection) async {
    try {
      final result = await localDataSource.createToDoCollection(collection: toDoCollectionToModel(collection));

      return Right(result);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(CollectionId collectionId, ToDoEntry entry) async {
    try {
      final result = await localDataSource.createToDoEntry(
        collectionId: collectionId.value,
        entry: toDoEntryToModel(entry),
      );

      return Right(result);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() async {
    try {
      final collectionIds = await localDataSource.getToDoCollectionIds();
      final List<ToDoCollection> collections = [];
      for (String collectionId in collectionIds) {
        final collection = await localDataSource.getToDoCollection(collectionId: collectionId);
        collections.add(toDoCollectionModelToEntity(collection));
      }
      return Right(collections);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) async {
    try {
      final result = await localDataSource.getToDoEntry(
        collectionId: collectionId.value,
        entryId: entryId.value,
      );

      return Right(toDoEntryModelToEntity(result));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) async {
    try {
      final entries = await localDataSource.getToDoEntryIds(collectionId: collectionId.value);

      return Right(entries.map((id) => EntryId.fromUniqueString(id)).toList());
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) async {
    try {
      final entry = await localDataSource.updateToDoEntry(collectionId: collectionId.value, entryId: entryId.value);

      return Right(toDoEntryModelToEntity(entry));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  ToDoEntry toDoEntryModelToEntity(ToDoEntryModel model) {
    final entity = ToDoEntry(
      id: EntryId.fromUniqueString(model.id),
      description: model.description,
      isDone: model.isDone,
    );

    return entity;
  }

  ToDoCollection toDoCollectionModelToEntity(ToDoCollectionModel model) {
    final entity = ToDoCollection(
      id: CollectionId.fromUniqueString(model.id),
      title: model.title,
      color: ToDoColor(colorIndex: model.colorIndex),
    );

    return entity;
  }

  ToDoEntryModel toDoEntryToModel(ToDoEntry entry) {
    final model = ToDoEntryModel(
      id: entry.id.value,
      description: entry.description,
      isDone: entry.isDone,
    );

    return model;
  }

  ToDoCollectionModel toDoCollectionToModel(ToDoCollection collection) {
    final model = ToDoCollectionModel(
      id: collection.id.value,
      title: collection.title,
      colorIndex: collection.color.colorIndex,
    );

    return model;
  }
}
