import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/services/database.dart';

class Listings with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  List<Listing>? _listings;

  List<Listing>? get get => this._listings;

  Listings() {
    this.initListings();
  }

  void initListings() {
    this.updateListings();
  }

  Future<void> updateListings() async {
    this._listings = await _databaseService.getListings();
    notifyListeners();
  }
}
