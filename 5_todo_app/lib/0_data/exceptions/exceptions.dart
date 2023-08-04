class ServerException implements Exception {}

class FirestoreCollectionNotFoundException implements ServerException {
  final String id;

  FirestoreCollectionNotFoundException({required this.id});
}

class CacheException implements Exception {}

class CollectionNotFoundException implements CacheException {}

class EntryNotFoundException implements CacheException {}
