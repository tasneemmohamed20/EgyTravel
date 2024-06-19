import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/login_screen.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:egy_travel/view_model/SignUpCubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.secondPrimary.withOpacity(1),
                ),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            Navigator.pop(context);
            showSuccessDialog(context);
          },
          signupError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.secondPrimary,
          title: const Text('Signup Successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have signed up successfully!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorsManager.primary.withOpacity(1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primary,
                backgroundColor: ColorsManager.primary,
                disabledForegroundColor: ColorsManager.primary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()),
                );
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: ColorsManager.primary.withOpacity(1),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        );
      },
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
