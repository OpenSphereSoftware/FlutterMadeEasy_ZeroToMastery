part of 'auth_cubit.dart';

@immutable
abstract class AuthCubitState {}

class AuthCubitInitial extends AuthCubitState {
  final bool isLoggedIn;
  final String? userId;

  AuthCubitInitial({
    required this.isLoggedIn,
    this.userId,
  });
}
