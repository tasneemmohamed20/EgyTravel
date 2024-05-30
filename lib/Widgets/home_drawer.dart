import 'package:egy_travel/Screens/Settings/settings_screen.dart';
import 'package:egy_travel/Screens/test_screen.dart';
import 'package:egy_travel/Widgets/shared_list_tile.dart';
import 'package:egy_travel/constants/colors_manager.dart';
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
              height: MediaQuery.of(context).size.height * 0.2,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://i.etsystatic.com/19647689/r/il/d67fbb/1891879820/il_570xN.1891879820_eww4.jpg')),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
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
                        builder: (context) => const TestPage(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.favorite_rounded,
                title: 'Favorites',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.map_rounded,
                title: 'Plans',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
                      ),
                    )),
            CustomListTile(
                leadingIcon: Icons.language,
                title: 'App Language',
                elementsColor: ColorsManager.primary.withOpacity(1),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(),
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
