import 'package:egy_travel/core/Di/dependency_injection.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/verfication_code_screen.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:egy_travel/view_model/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:egy_travel/view_model/ResetCubit/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotBlocListener extends StatelessWidget {
  const ForgotBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotCubit, ForgotState>(
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
          success: (forgotResponse) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => getIt<ResetPasswordCubit>(),
                        child: const VerficationCodeScreen(),
                      )),
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
