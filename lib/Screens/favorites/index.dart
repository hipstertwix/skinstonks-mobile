import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader('Favorites', titleIcon: Icons.favorite_rounded, titleIconSize: 18),
      ],
    );
  }
}
