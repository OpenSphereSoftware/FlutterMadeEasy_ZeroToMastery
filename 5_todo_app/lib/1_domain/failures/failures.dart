import 'package:equatable/equatable.dart';

abstract class Failure {}

class CacheFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];

  @override
  String toString() => stackTrace ?? '';
}

class GeneralFailure extends Failure with EquatableMixin {
  GeneralFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];

  @override
  String toString() => stackTrace ?? '';
}
