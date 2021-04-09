import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/services/database.dart';

class Listings with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<Listing>? _listings;
  List<Listing>? _favorites;

  List<Listing>? get get => this._listings;
  List<Listing>? get getFavorites => this._favorites;

  Listings() {
    this.initListings();
  }

  void initListings() async {
    await this.updateListings();
    await this.updateFavorites();
    this.filterListings();
    notifyListeners();
  }

  void filterListings() {
    if (this._listings == null || this._listings!.isEmpty) return;

    // Remove favorites from listings
    if (this._favorites!.isNotEmpty) {
      List toRemove = [];
      this._listings!.forEach((element) {
        if (this._favorites!.contains(element)) toRemove.add(element);
      });
      this._listings!.removeWhere((e) => toRemove.contains(e));
    }
  }

  // TODO: Filter listings (example: remove favorited items, or based on the user filters)
  Future<void> updateListings() async {
    this._listings = await _databaseService.getListings();
  }

  Future<void> updateFavorites() async {
    this._favorites = [];
    List? favorites = await _databaseService.getFavorites();
    if (favorites == null) return;
    if (this._listings != null) {
      this._listings!.forEach((element) {
        if (favorites.contains(element.id)) {
          this._favorites!.add(element);
        }
      });
    }
  }

  Future<void> addToFavorites(Listing listing) async {
    bool addToFavorites = await _databaseService.addToFavorites(listing);

    if (addToFavorites == true) {
      if (this._favorites == null) this._favorites = [];
      this._favorites!.add(listing);
      notifyListeners();
      print('added to favorites');
    }
  }
}
