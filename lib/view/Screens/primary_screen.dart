import 'package:easy_localization/easy_localization.dart';
import 'package:egy_travel/res/app_assets.dart';
import 'package:egy_travel/res/colors_manager.dart';
import 'package:egy_travel/view/Screens/chatbot.dart';
import 'package:egy_travel/view/Screens/events_screen.dart';
import 'package:egy_travel/view/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  PrimaryScreenState createState() => PrimaryScreenState();
}

class PrimaryScreenState extends State<PrimaryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _changeLanguage(context.locale);
      // If you need to use EasyLocalization.of(context) to listen for locale changes, do it here
    });
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _changeLanguage(Locale newLocale) async {
    await context.setLocale(newLocale); // Update the locale
    setState(() {}); // Rebuild the widget after locale change
  }

  @override
  Widget build(BuildContext context) {
    Widget actriveScreen = const Home();
    if (_selectedPageIndex == 1) {
      actriveScreen = const EventsScreen();
    } else if (_selectedPageIndex == 2) {
      actriveScreen = const ChatbotScreen();
    }

    return SafeArea(
        child: Scaffold(
      body: actriveScreen,
      bottomNavigationBar: PopScope(
        canPop: _selectedPageIndex != 0 ? false : true,
        onPopInvoked: (value) {
          if (_selectedPageIndex != 0) {
            setState(() {
              _selectedPageIndex = 0;
            });
          } else {
            Navigator.pop(context);
          }
        },
        child: BottomNavigationBar(
          backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
          selectedItemColor: ColorsManager.primary.withOpacity(1),
          unselectedItemColor: Colors.grey,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.map_outlined),
              label: 'Events'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  Assets.chatbot,
                ),
              ),
              label: 'SNOUHI'.tr(),
            ),
          ],
        ),
      ),
    ));
  }
}
