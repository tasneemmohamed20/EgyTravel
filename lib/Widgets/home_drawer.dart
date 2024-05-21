import 'package:egy_travel/Data/dummy_data.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  Widget customDrawerTile({
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
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: drawerItems.length - 1,
                  itemBuilder: (context, index) {
                    final tiles = drawerItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 6),
                      child: customDrawerTile(
                          leadingIcon: tiles['leadingIcon'],
                          title: tiles['title'],
                          onTap: tiles['onTap']),
                    );
                  }),
            ),
            customDrawerTile(
                leadingIcon: drawerItems.last['leadingIcon'],
                title: drawerItems.last['title'],
                onTap: drawerItems.last['onTap'])
          ],
        ));
  }
}
