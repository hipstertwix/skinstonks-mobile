import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/providers/listings.dart';
import 'package:skinstonks_mobile/screens/home/favorites/index.dart';
import 'package:skinstonks_mobile/screens/home/listings/index.dart';
import 'package:skinstonks_mobile/screens/home/notifications/index.dart';
import 'package:skinstonks_mobile/screens/home/settings/index.dart';
import 'package:skinstonks_mobile/services/connection_status.dart';
import 'package:skinstonks_mobile/widgets/custom_nav_bar.dart';
import 'package:skinstonks_mobile/widgets/main_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _connectionChangeStream;

  int _currentIndex = 0;

  final screens = List<Widget>.unmodifiable([
    ListingsScreen(),
    FavoritesScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ]);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Listings>(
      create: (_) => Listings(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: MainContainer(
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: CustomNavigationBar(
          items: [
            CustomNavigationBarItem(
              icon: EvaIcons.homeOutline,
              selectedIcon: EvaIcons.home,
            ),
            CustomNavigationBarItem(
              icon: Icons.favorite_outline,
              selectedIcon: Icons.favorite_rounded,
            ),
            CustomNavigationBarItem(
              icon: Icons.notifications_none_rounded,
              selectedIcon: Icons.notifications_rounded,
            ),
            CustomNavigationBarItem(
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
      ),
    );
  }

  @override
  initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    if (!hasConnection) {
      Fluttertoast.showToast(
        msg: "No Internet connection.",
        toastLength: Toast.LENGTH_LONG,
        fontSize: 16.0,
      );
    }
  }
}
