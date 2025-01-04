import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart ';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zenaura/maintab_screens/Home.dart';

import 'package:zenaura/maintab_screens/Search.dart';
import 'package:zenaura/admin/send_notification.dart';
import 'package:zenaura/screens/Profile_page.dart';
import 'package:zenaura/maintab_screens/favourite_page.dart';
import 'package:zenaura/maintab_screens/notidf.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MaintabviewState();
}

class _MaintabviewState extends State<MainTabview> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Notify(),
    FavoriteSongsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            padding: const EdgeInsets.all(16),
            tabBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
            gap: 8,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.notifications_none_outlined,
                text: 'Notifications',
              ),
              GButton(
                icon: Icons.favorite_outline_rounded,
                text: 'favorites',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
