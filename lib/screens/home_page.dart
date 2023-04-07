import 'package:flutter/material.dart';

import '/colors.dart';
import '/screens/camera_tab_screen.dart';
import '/screens/home_tab_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    CameraTab(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondBGColor,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
                backgroundColor: mainBGColor
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera_front_sharp),
              label: 'Camera',
                backgroundColor: mainBGColor
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
                backgroundColor: mainBGColor
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
                backgroundColor: mainBGColor
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Profile',
                backgroundColor: mainBGColor
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: mainFontColor,
          selectedItemColor: darkOrangeColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          onTap: _onItemTapped,
          backgroundColor: mainBGColor,
        ),
      ),
    );
  }
}
