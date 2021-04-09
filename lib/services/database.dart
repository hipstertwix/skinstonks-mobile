import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/services/auth.dart';

class DatabaseService with ChangeNotifier {
  final AuthService _authService = locator<AuthService>();
  String? _jwtToken;

  DatabaseService() {
    this._jwtToken = getUserJwtToken();
  }

  String? getUserJwtToken() {
    final user = _authService.user;
    if (user != null) return user.jwtToken;
  }

  Future<bool> swipeListing(Listing listing, bool swipeIsFavorite) async {
    try {
      var response = await http.post(
        Uri.https(API_URL, LISTINGS_BASE + '/swipe/' + listing.id),
        body: json.encode({'swipe_is_favorite': swipeIsFavorite}),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": this._jwtToken!,
        },
      );
      if (response is Response && response.statusCode == 200) {
        List swipeTarget = swipeIsFavorite
            ? _authService.userData!.favoriteItems!
            : _authService.userData!.dislikedItems!;
        swipeTarget.add(listing);
        print('swiped successfully');
        return true;
      }
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<List<Listing>?> getListings() async {
    if (this._jwtToken == null) return null;
    try {
      var response = await http.get(
        Uri.https(API_URL, LISTINGS_BASE),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": this._jwtToken!,
        },
      );
      var body = json.decode(response.body);

      if (response is Response) {
        if (response.statusCode == 200) {
          List<Listing> listings = [];

          body.forEach((element) {
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
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
