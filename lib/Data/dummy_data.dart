import 'package:egy_travel/constants/app_assets.dart';
import 'package:flutter/material.dart';

// home dummt data
final List<Map<String, dynamic>> items = [
  {'image': Assets.profile, 'title': 'Item 1', 'subtitle': 'Description 1'},
  {
    'image': Assets.imagesOnboarding3,
    'title': 'Tolpi Elforsan Hotel Ismailia',
    'subtitle': 'Al Temsah, Ismailia 1, Ismailia Governorate'
  },
  {
    'image': Assets.imagesImagetest,
    'title': 'Golden Hewel Ismailia',
    'subtitle': 'Description 3'
  },
  {'image': Assets.profile, 'title': 'Item 1', 'subtitle': 'Description 1'},
  {
    'image': Assets.imagesOnboarding3,
    'title': 'Tolpi Elforsan Hotel Ismailia',
    'subtitle': 'Al Temsah, Ismailia 1, Ismailia Governorate'
  },
  {
    'image': Assets.imagesImagetest,
    'title': 'Golden Hewel Ismailia',
    'subtitle': 'Description 3'
  },
];

// Drawer ListTiles data
final List<Map<String, dynamic>> drawerItems = [
  {
    'title': 'Profile',
    'leadingIcon': Icons.person_2_rounded,
    'onTap': () {},
  },
  {
    'title': 'Favorites',
    'leadingIcon': Icons.favorite_rounded,
    'onTap': () {},
  },
  {
    'title': 'My Trips',
    'leadingIcon': Icons.map_rounded,
    'onTap': () {},
  },
  {
    'title': 'App Language',
    'leadingIcon': Icons.language,
    'onTap': () {},
  },
  {
    'title': 'Settings',
    'leadingIcon': Icons.settings,
    'onTap': () {},
  },
  {
    'title': 'Logout',
    'leadingIcon': Icons.logout_rounded,
    'onTap': () {},
  },
];
