import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constans.dart';
import 'package:untitled/screens/Home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen ({Key? key}) : super (key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: IndexedStack(
        index: selectedindex,
        children: [
          Home()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: kTextColor,
          currentIndex: selectedindex,
          backgroundColor: kPrimaryColor,
          onTap: onTaped,
          items: [
            BottomNavigationBarItem(
                label: '홈', icon: Icon(CupertinoIcons.home, size: screenWidth < 900 ? 30.0 : 40.0)),
            BottomNavigationBarItem(
                label: '축사', icon: Icon(CupertinoIcons.wrench, size: screenWidth < 900 ? 30.0 : 40.0)),
            BottomNavigationBarItem(
                label: '팜', icon: Icon(CupertinoIcons.bell, size: screenWidth < 900 ? 30.0 : 40.0)),
          ]),
    );
  }

  void onTaped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}