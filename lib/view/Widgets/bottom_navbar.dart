import 'package:egy_travel/view/Screens/home_screen.dart';
import 'package:egy_travel/view/Screens/plans_screen.dart';
import 'package:egy_travel/view/Screens/test_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    PlansScreen(),
    TestPage(), // Assuming TestScreen is your third screen
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: Colors.blue, // Customize as needed
      selectedItemColor: Colors.white, // Customize as needed
      unselectedItemColor: Colors.grey, // Customize as needed
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_rounded),
          label: 'Events',
        ),
      ],
    );
  }
}
