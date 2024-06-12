import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/view/Screens/Settings/Privacy/change_password.dart';
import 'package:egy_travel/view/Screens/Settings/Privacy/delete_account.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_list_tile.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'Privacy'.tr(),
        enableBack: false,
        leading: backButton(context),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0, vertical: 32),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 16, bottom: 16),
                child: Text(
                  "PrivacyCaption".tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomListTile(
                title: 'ResetPassword'.tr(),
                elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()),
                    ),
                leadingIcon: Icons.password_rounded),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
              child: Divider(
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
            ),
            CustomListTile(
                title: 'DeleteAccount'.tr(),
                elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteAccount()),
                    ),
                leadingIcon: Icons.delete_outline),
          ],
        ),
      ),
    ));
  }
}
