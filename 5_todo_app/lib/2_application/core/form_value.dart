import 'package:equatable/equatable.dart';

class FormValue<T> with EquatableMixin {
  FormValue({required this.value, required this.validationStatus});

  final T value;
  final ValidationStatus validationStatus;

  @override
  List<Object?> get props => [value, validationStatus];
}

enum ValidationStatus {
  error,
  success,
  pending,
}
