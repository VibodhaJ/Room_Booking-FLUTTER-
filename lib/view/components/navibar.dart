import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:roombooking/view/screens/booking.dart';
import 'package:roombooking/view/screens/catogories.dart';

import 'package:roombooking/view/screens/home2.dart';

import 'package:roombooking/view/screens/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int myCurrentIndex = 0;
  List pages = const [
    home2(),
    Booking(),
    Catogories(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: GNav(
              gap: 15,
              onTabChange: (index) {
                print(index);
                setState(() {
                  myCurrentIndex = index;
                });
              },
              backgroundColor: Color.fromARGB(0, 0, 0, 0),
              tabBackgroundColor: Color.fromARGB(255, 255, 255, 255),
              tabBorderRadius: 50,
              padding: const EdgeInsets.all(8),

              // currentIndex : myCurrentIndex,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  iconSize: 28,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.book,
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  iconSize: 28,
                  text: "Booking",
                ),
                GButton(
                  icon: Icons.category_rounded,
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  iconSize: 28,
                  text: "category",
                ),
                GButton(
                  icon: Icons.person,
                  iconColor: Color.fromARGB(255, 255, 255, 255),
                  iconSize: 28,
                  text: "Profile",
                ),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
