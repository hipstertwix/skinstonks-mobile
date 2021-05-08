import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/providers/listings.dart';
import 'package:skinstonks_mobile/screens/home/favorites/components/favorite_item.dart';
import 'package:skinstonks_mobile/services/auth.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  final AuthService _authService = locator<AuthService>();

  List<dynamic>? favoriteItems;

  @override
  void initState() {
    super.initState();
    _setFavoriteItems();
  }

  Future<void> _updateFavoriteItems(Listings listingsProvider) async {
    await listingsProvider.updateUserListings();
    _setFavoriteItems();
  }

  void _setFavoriteItems() {
    setState(() {
      favoriteItems = _authService.userData!.favoriteItems!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listingsProvider = Provider.of<Listings>(context, listen: false);

    ScrollController controller = ScrollController();
    double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

    print('.');

    return Container(
      height: size.height - (statusBarHeight + 128 + 70),
      child: RefreshIndicator(
        backgroundColor: kPrimaryLightColor,
        color: kWhite,
        onRefresh: () => _updateFavoriteItems(listingsProvider),
        child: SingleChildScrollView(
          physics: new BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(bottom: 20, left: kSidePadding, right: kSidePadding),
            child: favoriteItems != null || favoriteItems!.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    controller: controller,
                    children: favoriteItems!.map((listing) {
                      return FavoriteItem(
                        name: listing.marketHashName,
                        price: listing.price,
                        potentialProfit: listing.potentialProfit,
                        imageUrl: listing.imageUrl,
                      );
                    }).toList(),
                  )
                : Text('No Favorites'),
          ),
        ),
      ),
    );
  }
}
