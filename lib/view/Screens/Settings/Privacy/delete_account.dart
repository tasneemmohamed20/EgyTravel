import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/core/helpers/shared_pref_helper.dart';
import 'package:egy_travel/model/Profile/DeleteAccount/delete_request_body.dart';
import 'package:egy_travel/view/Widgets/delete_bloc_listener.dart';
import 'package:egy_travel/view/Widgets/dropdown.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view_model/DeleteCubit/cubit/delete_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final List<String> reasons = [
    "Reson1".tr(),
    "Reson2".tr(),
    "Reson3".tr(),
    "Reson4".tr(),
    "Reson5".tr()
  ];
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'DeleteAccount'.tr(),
        enableBack: false,
        leading: backButton(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 32.0, end: 32.0, top: 32),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "${"Hi".tr()}Tasneem${"DeleteAccountCaption1".tr()}",
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
            child: Divider(
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 32.0, end: 32.0, top: 16),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "WhyDeleteAccount".tr(),
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomDropdown(items: reasons),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 32.0, end: 32.0, top: 16),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "DeleteAccountCaption2".tr(),
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 32),
            child: CustomPasswordField(
              passwordController:
                  context.read<DeleteAccountCubit>().passwordController,
              labelText: 'YourPassword'.tr(),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 32),
            child: CustomButton(
                onPressed: () {
                  context.read<DeleteAccountCubit>().emitDeleteState(
                      DeleteRequestBody(
                          password: context
                              .read<DeleteAccountCubit>()
                              .passwordController
                              .text));
                  SharedPrefHelper.clearAllData();
                },
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 100, vertical: 16),
                backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                text: 'DeleteAccount'.tr()),
          ),
          const DeleteBlocListener()
        ],
      ),
    ));
  }
}
