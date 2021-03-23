import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:skinstonks_mobile/screens/favorites/index.dart';
import 'package:skinstonks_mobile/screens/home/index.dart';
import 'package:skinstonks_mobile/screens/notifications/index.dart';
import 'package:skinstonks_mobile/screens/settings/index.dart';
import 'package:skinstonks_mobile/widgets/custom_nav_bar.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  final screens = List<Widget>.unmodifiable([
    HomeScreen(),
    FavoritesScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: MyCustomNavigationBar(
        items: [
          MyCustomNavigationBarItem(
            icon: EvaIcons.homeOutline,
            selectedIcon: EvaIcons.home,
          ),
          MyCustomNavigationBarItem(
            icon: Icons.favorite_outline,
            selectedIcon: Icons.favorite_rounded,
          ),
          MyCustomNavigationBarItem(
            icon: Icons.notifications_none_rounded,
            selectedIcon: Icons.notifications_rounded,
          ),
          MyCustomNavigationBarItem(
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings_rounded,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

/*CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: kPrimaryColor,
        strokeColor: kPrimaryLightColor,
        unSelectedColor: kPrimaryLightColor,
        backgroundColor: Colors.white,
        borderRadius: Radius.circular(20.0),
        isFloating: true,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ), */