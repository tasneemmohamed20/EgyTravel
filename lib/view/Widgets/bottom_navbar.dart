import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/colors_manager.dart';
// import 'package:egy_travel/view/Screens/home_screen.dart';
// import 'package:egy_travel/view/Screens/plans_screen.dart';
// import 'package:egy_travel/view/Screens/test_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  // final List<Widget> _screens = [
  //   const Home(),
  //   const PlansScreen(),
  //   const TestPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
      selectedItemColor: ColorsManager.primary.withOpacity(1),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Home'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.map_outlined),
          label: 'Plans'.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.event_rounded),
          label: 'Events'.tr(),
        ),
      ],
    );
  }
}
