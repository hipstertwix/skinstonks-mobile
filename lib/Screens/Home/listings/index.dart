import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/screens/home/listings/components/listings_cards_stack.dart';
import 'package:skinstonks_mobile/widgets/buttons/action_button.dart';
import 'package:skinstonks_mobile/widgets/app_header.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader(
          'Listings',
          titleIcon: Icons.star_rounded,
          titleIconSize: 23,
          actionButton: ActionButton(
            icon: Icons.filter_alt_rounded,
            iconSize: 24,
            onPressed: () {},
          ),
        ),
        ListingsCardsStack()
      ],
    );
  }
}
