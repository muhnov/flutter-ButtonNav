import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:tugas_6/home.dart';
import 'package:tugas_6/massage.dart';
import 'package:tugas_6/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;

  final List<IconData> iconList = [Icons.home, Icons.message, Icons.person];

  final List<Widget> screens = [Home(), Message(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_bottomNavIndex],
      // Hapus FloatingActionButton
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none, // Tidak ada gap karena tidak ada FAB
        notchSmoothness: NotchSmoothness.defaultEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Colors.white,
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.grey,
        splashColor: Colors.deepPurpleAccent,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
