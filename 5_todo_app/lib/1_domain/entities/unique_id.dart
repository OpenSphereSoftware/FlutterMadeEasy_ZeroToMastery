import 'package:uuid/uuid.dart';

class UniqueID {
  const UniqueID._(this.value);

  final String value;

  factory UniqueID() {
    return UniqueID._(const Uuid().v4());
  }

  factory UniqueID.fromUniqueString(String uniqueID) {
    return UniqueID._(uniqueID);
  }

  @override
  String toString() {
    return value;
  }
}

class CollectionId extends UniqueID {
  const CollectionId._(String value) : super._(value);

  factory CollectionId() {
    return CollectionId._(const Uuid().v4());
  }

  factory CollectionId.fromUniqueString(String uniqueID) {
    return CollectionId._(uniqueID);
  }
}

class EntryId extends UniqueID {
  const EntryId._(String value) : super._(value);

  factory EntryId() {
    return EntryId._(const Uuid().v4());
  }

  factory EntryId.fromUniqueString(String uniqueID) {
    return EntryId._(uniqueID);
  }
}
