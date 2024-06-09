import 'package:egy_travel/view/Screens/Settings/General/general.dart';
import 'package:egy_travel/view/Screens/Settings/Privacy/privacy.dart';
import 'package:egy_travel/view/Screens/test_screen.dart';
import 'package:egy_travel/view/Widgets/shared_appbar.dart';
import 'package:egy_travel/view/Widgets/shared_list_tile.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsManager.primary.withOpacity(1),
      appBar: CustomAppBar(
        title: 'Settings',
        enableBack: false,
        leading: backButton(context),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://i.etsystatic.com/19647689/r/il/d67fbb/1891879820/il_570xN.1891879820_eww4.jpg')),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tasneem M.Mohamed',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.secondPrimary.withOpacity(1)),
                    ),
                    Text(
                      'Tasneemmohamed20@gmail.com',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          color: ColorsManager.secondPrimary.withOpacity(1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Divider(
            color: ColorsManager.secondPrimary.withOpacity(1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              CustomListTile(
                  title: 'General',
                  hint: 'Personal information settings',
                  elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GeneralSettingse()),
                      ),
                  leadingIcon: Icons.tune_rounded),
              CustomListTile(
                  title: 'Privacy',
                  hint: 'Account and password settings',
                  elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Privacy()),
                      ),
                  leadingIcon: Icons.shield_rounded),
              CustomListTile(
                  title: 'App Language',
                  hint: 'Select Your Language',
                  elementsColor: ColorsManager.secondPrimary.withOpacity(1),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TestPage()),
                      ),
                  leadingIcon: Icons.language)
            ],
          ),
        ),
      ]),
    ));
  }
}
