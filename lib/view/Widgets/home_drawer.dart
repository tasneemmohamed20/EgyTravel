import 'package:egy_travel/view/Screens/Settings/settings_screen.dart';
import 'package:egy_travel/view/Screens/chatbot.dart';
import 'package:egy_travel/view/Screens/mytrips_screen.dart';
import 'package:egy_travel/view/Screens/profile.dart';
import 'package:egy_travel/view/Screens/test_screen.dart';
import 'package:egy_travel/view/Widgets/shared_list_tile.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://i.etsystatic.com/19647689/r/il/d67fbb/1891879820/il_570xN.1891879820_eww4.jpg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                      ),
                      child: Text(
                        'Welcome, Tasneem',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.secondPrimary.withOpacity(1)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomListTile(
                leadingIcon: Icons.person_2_rounded,
                title: 'Profile',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.map_rounded,
                title: 'My Trips',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TripsScreen(
                          screenTilte: 'My Trips',
                        ),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.favorite_rounded,
                title: 'Favorites',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tabs(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.settings,
                title: 'Settings',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.contact_support_rounded,
                title: 'Contact Us',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatbotScreen(),
                      ),
                    )),
            const Spacer(),
            CustomListTile(
                leadingIcon: Icons.logout_rounded,
                title: 'Logout',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
                      ),
                    ))
          ],
        ));
  }
}
