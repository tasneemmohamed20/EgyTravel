import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/login_screen.dart';
import 'package:egy_travel/view_model/DeleteCubit/cubit/delete_account_cubit.dart';
import 'package:egy_travel/view_model/DeleteCubit/cubit/delete_account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBlocListener extends StatelessWidget {
  const DeleteBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
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
          success: (changeResponse) {
            Navigator.pop(context);
            showSuccessDialog(context);
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

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.secondPrimary,
          title: const Text('Account Deleted'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'You have deleted your account.',
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                    (route) => false);
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
        );
      },
    );
  }
}
