import 'package:egy_travel/view/Widgets/dropdown.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_button.dart';
import 'package:egy_travel/view/Widgets/shared_text_field.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final List<String> reasons = [
    'Want to remove something',
    'Privacy concern',
    'Created a seconed account',
    'Trouble getting started',
    'Something else'
  ];
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'Delete Account',
        enableBack: false,
        leading: backButton(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hi, Tasneem\nWe are Sorry to hear you\'d like to delete your account.',
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: ColorsManager.secondPrimary.withOpacity(1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'why are you deleting your account?',
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
              alignment: Alignment.centerLeft,
              child: CustomDropdown(items: reasons),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'To continue, please enter your password',
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.secondPrimary.withOpacity(1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomPasswordField(
                controller: password,
                labelText: 'Your Password',
                borderColor: ColorsManager.secondPrimary.withOpacity(1),
                validator: validatePassword),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: CustomButton(
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
                text: 'Delete Account'),
          )
        ],
      ),
    ));
  }
}
