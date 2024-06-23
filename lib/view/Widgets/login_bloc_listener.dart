import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/LoginCubit/cubit/login_cubit.dart';
import '../../view_model/LoginCubit/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.secondPrimary.withOpacity(1),
                ),
              ),
            );
          },
          success: (loginResponse) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManager.secondPrimary,
        icon: Icon(
          Icons.error,
          color: ColorsManager.primary.withOpacity(1),
          size: 32,
        ),
        content: Text(
          error,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.primary.withOpacity(1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Got it',
              style: TextStyle(
                color: ColorsManager.primary.withOpacity(1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
