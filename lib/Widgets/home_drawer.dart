import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  Widget customListTile({
    required IconData leadingIcon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
        leading: Icon(
          leadingIcon,
          size: 30,
          color: ColorsManager.primary.withOpacity(1),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: ColorsManager.primary.withOpacity(1),
            fontSize: 24,
          ),
        ),
        onTap: onTap);
  }

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
            customListTile(
                title: 'Profile',
                leadingIcon: Icons.person_2_rounded,
                onTap: () {}),
            customListTile(
                title: 'Favorites',
                leadingIcon: Icons.favorite_rounded,
                onTap: () {}),
            customListTile(
                title: 'My Trips',
                leadingIcon: Icons.map_rounded,
                onTap: () {}),
            customListTile(
                title: 'App Language',
                leadingIcon: Icons.language,
                onTap: () {}),
            customListTile(
                title: 'Settings', leadingIcon: Icons.settings, onTap: () {}),
            const Spacer(),
            customListTile(
                title: 'Logout',
                leadingIcon: Icons.logout_rounded,
                onTap: () {}),
          ],
        ));
  }
}
