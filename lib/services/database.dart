import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/services/api_base_helper.dart';
import 'package:skinstonks_mobile/services/auth.dart';

class DatabaseService with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();

  late ApiBaseHelper _apiBaseHelper;

  DatabaseService() {
    this.initDatabaseService();
  }

  void initDatabaseService() {
    this._apiBaseHelper = ApiBaseHelper(authService: _authService);
  }

  Future swipeListing(Listing listing, bool swipeIsFavorite) async {
    try {
      await this._apiBaseHelper.callApi(
        'POST',
        LISTINGS_BASE + "/swipe/" + listing.id,
        body: {'swipe_is_favorite': swipeIsFavorite},
      );

      List swipeTarget = swipeIsFavorite
          ? _authService.userData!.favoriteItems!
          : _authService.userData!.dislikedItems!;
      swipeTarget.add(listing);
    } catch (err) {
      throw err;
    }
  }

  Future<List<Listing>?> getListings() async {
    try {
      var response = await this._apiBaseHelper.callApi(
            'GET',
            LISTINGS_BASE,
          );
      if (response == null) return null;

      List<Listing> listings = [];
      response.forEach((element) {
        listings.add(Listing(
          id: element['_id'].toString(),
          marketHashName: element['market_hash_name'],
          price: element['price'].toDouble(),
          potentialProfit: element['potential_profit'].toDouble(),
          imageUrl: element['image'],
          withdrawableAt: element['withdrawable_at'],
        ));
      });
      return listings;
    } catch (err) {
      throw err;
    }
  }
}
