import 'package:flutter/material.dart';

import '../const/color.dart';
import '../const/const.dart';

class NavigatorScreen extends StatefulWidget {
  NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int currentIndex = 0;

  void navigatorIndex(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: navigatorBackgroundColor,
        currentIndex: currentIndex,
        onTap: (v) {
          navigatorIndex(v);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: navigatorBackgroundColor,
            icon: Icon(
              Icons.home_outlined,
              size: size.width / 17,
              color: const Color(0xffdcd6f7),
            ),
            activeIcon: Icon(
              Icons.home,
              color: const Color(0xffa6b1e1),
              size: size.width / 14,
            ),
            label: 'Home',
          ),
        /*  BottomNavigationBarItem(
              icon: Container(
            width: size.width / 5,
            height: size.width / 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width / 20,
              ),
            ),
          )),*/
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(
              Icons.attractions,
              size: size.width / 17,
              color: const Color(0xffdcd6f7),
            ),
            activeIcon: Icon(
              Icons.home,
              color: const Color(0xffffffff),
              size: size.width / 14,
            ),
            label: 'Attractions',
          ), BottomNavigationBarItem(
            backgroundColor: navigatorBackgroundColor,
            icon: Icon(
              Icons.attractions,
              size: size.width / 17,
              color: const Color(0xffdcd6f7),
            ),
            activeIcon: Icon(
              Icons.home,
              color: const Color(0xffa6b1e1),
              size: size.width / 14,
            ),
            label: 'Attractions',
          ),
        ],
      ),
    );
  }
}


