import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/locator.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/database.dart';

class Listings with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  final AuthService _authService = locator<AuthService>();

  List<Listing>? _listings;

  List<Listing>? get get => this._listings;

  Listings() {
    this.initListings();
  }

  void initListings() async {
    await this.updateListings();
  }

  void filterListings() {
    if (this._listings == null || this._listings!.isEmpty) return;

    // Remove favorites/disliked from listings
    List toRemove = [];
    List favorites = _authService.userData!.favoriteItems!;
    List disliked = _authService.userData!.dislikedItems!;
    this._listings!.forEach((element) {
      if (favorites.contains(element) || disliked.contains(element)) toRemove.add(element);
    });
    this._listings!.removeWhere((e) => toRemove.contains(e));

    // TODO: Filter listings based on the user filters)
  }

  Future<void> updateListings() async {
    // Set listings to null and notify listeners (to make loading ring show up)
    this._listings = null;
    notifyListeners();
    // Get the listings from the DB and update
    this._listings = await _databaseService.getListings();
    await this.populateUserListings();
    this.filterListings();
    notifyListeners();
  }

  Future<void> populateUserListings() async {
    final userData = await _authService.getUserData();
    _authService.userData?.favoriteItems = populateListings(userData?['favorite_items']);
    _authService.userData?.dislikedItems = populateListings(userData?['disliked_items']);
  }

  List<Listing>? populateListings(List ids) {
    List<Listing> populatedListings = [];
    if (this._listings != null) {
      this._listings!.forEach((element) {
        if (ids.contains(element.id)) {
          populatedListings.add(element);
        }
      });
    }
    return populatedListings;
  }
}
