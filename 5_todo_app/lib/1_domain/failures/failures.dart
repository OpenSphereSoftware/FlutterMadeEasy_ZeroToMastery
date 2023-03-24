import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure({this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
