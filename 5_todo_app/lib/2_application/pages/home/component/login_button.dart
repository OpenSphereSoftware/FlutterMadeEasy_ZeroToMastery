import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/2_application/app/cubit/auth_cubit.dart';

/// does need an auth cubit instance provided
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        String buttonTitle = 'Login';
        Function onPressed = () => context.pushNamed('login');

        if (state is AuthCubitInitial && state.isLoggedIn) {
          buttonTitle = 'Profile';
          onPressed = () => context.pushNamed('profile');
        }

        return TextButton(
          onPressed: () => onPressed(),
          child: Text(buttonTitle),
        );
      },
    );
  }
}
