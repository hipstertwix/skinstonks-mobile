import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/screens/home/favorites/components/favorites_list.dart';
import 'package:skinstonks_mobile/widgets/home_header.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader('Favorites', titleIcon: Icons.favorite_rounded, titleIconSize: 18),
        FavoritesList(),
      ],
    );
  }
}
