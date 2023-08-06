import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_remote_data_source_interface.dart';
import 'package:todo_app/0_data/data_sources/mapper/todo_collection_mapper.dart';
import 'package:todo_app/0_data/data_sources/mapper/todo_entry_mapper.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';

class ToDoRepositoryMixed with ToDoCollectionMapper, ToDoEntryMapper implements ToDoRepository {
  final ToDoLocalDataSourceInterface localDataSource;
  final ToDoRemoteDataSourceInterface remoteSource;

  ToDoRepositoryMixed({
    required this.localDataSource,
    required this.remoteSource,
  });

  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<Either<Failure, bool>> createToDoCollection(ToDoCollection collection) async {
    if (isUserLoggedIn) {
      try {
        final result = await remoteSource.createToDoCollection(
          userId: userId!,
          collection: toDoCollectionToModel(collection),
        );

        return Right(result);
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
      try {
        final result = await localDataSource.createToDoCollection(collection: toDoCollectionToModel(collection));

        return Right(result);
      } on CacheException catch (e) {
        return Future.value(Left(CacheFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(
    CollectionId collectionId,
    ToDoEntry entry,
  ) async {
    if (isUserLoggedIn) {
      try {
        final result = await remoteSource.createToDoEntry(
          userId: userId!,
          collectionId: collectionId.value,
          entry: toDoEntryToModel(entry),
        );

        return Right(result);
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
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
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() async {
    if (isUserLoggedIn) {
      try {
        final collectionIds = await remoteSource.getToDoCollectionIds(userId: userId!);
        final List<ToDoCollection> collections = [];
        for (String collectionId in collectionIds) {
          final collection = await remoteSource.getToDoCollection(
            userId: userId!,
            collectionId: collectionId,
          );
          collections.add(toDoCollectionModelToEntity(collection));
        }
        return Right(collections);
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
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
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(CollectionId collectionId, EntryId entryId) async {
    if (isUserLoggedIn) {
      try {
        final result = await remoteSource.getToDoEntry(
          userId: userId!,
          collectionId: collectionId.value,
          entryId: entryId.value,
        );

        return Right(toDoEntryModelToEntity(result));
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
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
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(CollectionId collectionId) async {
    if (isUserLoggedIn) {
      try {
        final entries = await remoteSource.getToDoEntryIds(
          userId: userId!,
          collectionId: collectionId.value,
        );

        return Right(entries.map((id) => EntryId.fromUniqueString(id)).toList());
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
      try {
        final entries = await localDataSource.getToDoEntryIds(collectionId: collectionId.value);

        return Right(entries.map((id) => EntryId.fromUniqueString(id)).toList());
      } on CacheException catch (e) {
        return Future.value(Left(CacheFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry({
    required CollectionId collectionId,
    required ToDoEntry entry,
  }) async {
    if (isUserLoggedIn) {
      try {
        final updateEntry = await remoteSource.updateToDoEntry(
          userId: userId!,
          collectionId: collectionId.value,
          entry: toDoEntryToModel(entry),
        );

        return Right(toDoEntryModelToEntity(updateEntry));
      } on ServerException catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    } else {
      try {
        final updateEntry = await localDataSource.updateToDoEntry(
          collectionId: collectionId.value,
          entryId: entry.id.value,
        );

        return Right(toDoEntryModelToEntity(updateEntry));
      } on CacheException catch (e) {
        return Future.value(Left(CacheFailure(stackTrace: e.toString())));
      } on Exception catch (e) {
        return Future.value(Left(ServerFailure(stackTrace: e.toString())));
      }
    }
  }
}
