import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/0_data/data_sources/interfaces/todo_local_data_source.dart';
import 'package:todo_app/0_data/exceptions/exceptions.dart';
import 'package:todo_app/0_data/models/todo_collection_model.dart';
import 'package:todo_app/0_data/models/todo_entry_model.dart';

class ToDoLocalHiveDataSource implements ToDoLocalDataSource {
  late BoxCollection todoCollections;

  bool isInitialized = false;

  Future<void> init() async {
    if (!isInitialized) {
      todoCollections = await BoxCollection.open(
        'todo', // Name of your database
        {'collection', 'entry'}, // Names of your boxes
        path: './',
      );
      isInitialized = true;
    }
  }

  Future<CollectionBox<Map>> _openCollectionBox() async {
    return todoCollections.openBox<Map>('collection');
  }

  Future<CollectionBox<Map>> _openEntryBox() async {
    return todoCollections.openBox<Map>('entry');
  }

  @override
  Future<bool> creatToDoCollection(ToDoCollectionModel collection) async {
    final collectionBox = await _openCollectionBox();
    final entryBox = await _openEntryBox();

    await collectionBox.put(collection.id, collection.toJson());
    await entryBox.put(collection.id, {});

    return Future.value(true);
  }

  @override
  Future<bool> createToDoEntry(String collectionId, ToDoEntryModel entry) async {
    final entryBox = await _openEntryBox();
    final entryList = await entryBox.get(collectionId);
    if (entryList == null) throw CollectionNotFoundException();

    entryList.cast<String, dynamic>().putIfAbsent(entry.id, () => entry.toJson());

    await entryBox.put(collectionId, entryList);

    return Future.value(true);
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(String collectionId) async {
    final collectionBox = await _openCollectionBox();
    final collection = await collectionBox.get(collectionId) as Map<String, dynamic>?;
    if (collection != null) {
      return Future.value(ToDoCollectionModel.fromJson(collection));
    } else {
      throw EntryNotFoundException();
    }
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(String collectionId, String entryId) async {
    final entryBox = await _openEntryBox();
    final entryList = await entryBox.get(collectionId);
    if (entryList == null) throw CollectionNotFoundException();
    if (!entryList.containsKey(entryId)) throw EntryNotFoundException();

    final entry = entryList[entryId].cast<String, dynamic>();

    if (entry != null) {
      return Future.value(ToDoEntryModel.fromJson(entry));
    } else {
      throw EntryNotFoundException();
    }
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry(String collectionId, String entryId) async {
    final entryBox = await _openEntryBox();
    final entryList = await entryBox.get(collectionId);
    if (entryList == null) throw CollectionNotFoundException();
    if (!entryList.containsKey(entryId)) throw EntryNotFoundException();

    final entry = ToDoEntryModel.fromJson(entryList[entryId].cast<String, dynamic>());
    final updatedEntry = ToDoEntryModel(
      id: entry.id,
      description: entry.description,
      isDone: !entry.isDone,
    );
    entryList[entryId] = updatedEntry.toJson();

    await entryBox.put(collectionId, entryList);

    return Future.value(updatedEntry);
  }

  @override
  Future<List<String>> getToDoEntryIds(String collectionId) async {
    final entryBox = await _openEntryBox();
    final entryList = await entryBox.get(collectionId);
    if (entryList == null) throw CollectionNotFoundException();

    final entryIdList = entryList.cast<String, dynamic>().keys.toList();

    return Future.value(entryIdList);
  }

  @override
  Future<List<ToDoCollectionModel>> getToDoCollections() async {
    final collectionBox = await _openCollectionBox();
    final collectionList = await collectionBox.getAllValues();
    if (collectionList.isNotEmpty) {
      final collectionModelList = <ToDoCollectionModel>[];
      for (final element in collectionList.values) {
        final castedMap = element.cast<String, dynamic>();
        final collectionModel = ToDoCollectionModel.fromJson(castedMap);
        collectionModelList.add(collectionModel);
      }
      return Future.value(collectionModelList);
    } else {
      return Future.value([]);
    }
  }
}
