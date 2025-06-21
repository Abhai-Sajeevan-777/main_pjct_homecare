import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_pjct_homecare/utils/constants/color_constants.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/booking_screen.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/home_screen.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/notification_screen.dart';
import 'package:main_pjct_homecare/view/home_screen/bott_navigation_bar/profile_screen.dart';

class BottNavigation extends StatefulWidget {
  const BottNavigation({super.key});

  @override
  State<BottNavigation> createState() => _BottNavigationState();
}

class _BottNavigationState extends State<BottNavigation> {
  int selectedindex = 0;
  List screen = [
    HomeScreen(),
    BookingScreen(fromDate: "", toDate: "", service: "", address: ""),
    //NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedindex,
        onTap: (value) {
          selectedindex = value;
          // log("$selectedindex");
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined, color: Colors.black),
            label: "Booking",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications_active, color: Colors.black),
          //   label: "Notifications",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
