import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_cubit.dart';
import 'package:egy_travel/view_model/EditProfile/cubit/edit_state.dart';
import 'package:egy_travel/view_model/profileCubit/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBlocListener extends StatelessWidget {
  const EditBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditCubit, EditState>(
      listenWhen: (previous, current) =>
          current is EditLoading ||
          current is EditSuccess ||
          current is EditError,
      listener: (context, state) {
        state.whenOrNull(
          editLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.secondPrimary.withOpacity(1),
                ),
              ),
            );
          },
          editSuccess: (resetResponse) {
            Navigator.pop(context);
            showSuccessDialog(context);
                                  context.read<ProfileCubit>().getProfile();

          },
          editError: (error) {
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
          title: const Text('updating succeeded'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Congratulations, you have updated your data successfully!',
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
                Navigator.pop(context);
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
        );
      },
    );
  }
}
