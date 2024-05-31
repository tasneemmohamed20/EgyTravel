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
        title: 'Privacy',
        enableBack: false,
        leading: backButton(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Control Your Privacy Settings..',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomListTile(
                title: 'Reset Password',
                elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()),
                    ),
                leadingIcon: Icons.password_rounded),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: ColorsManager.secondPrimary.withOpacity(1),
              ),
            ),
            CustomListTile(
                title: 'Delete Account',
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