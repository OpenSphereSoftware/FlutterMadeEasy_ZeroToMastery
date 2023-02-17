class ServerException implements Exception {}

class CacheExceptions implements Exception {}

class CollectionNotFoundException implements CacheExceptions {}
class EntryNotFoundException implements CacheExceptions {}
