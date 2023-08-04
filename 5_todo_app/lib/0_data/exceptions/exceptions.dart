class ServerException implements Exception {}

class FirestoreCollectionNotFoundException implements ServerException {
  final String id;

  FirestoreCollectionNotFoundException({required this.id});
}

class FirestoreEntryNotFoundException implements ServerException {
  final String id;
  final String collectionId;

  FirestoreEntryNotFoundException({
    required this.id,
    required this.collectionId,
  });
}

class CacheException implements Exception {}

class CollectionNotFoundException implements CacheException {}

class EntryNotFoundException implements CacheException {}
