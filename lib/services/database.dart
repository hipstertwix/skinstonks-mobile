import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:skinstonks_mobile/constants/api_paths.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';

class DatabaseService {
  DatabaseService({required this.jwtToken});

  final String jwtToken;

  Future<dynamic> getListings() async {
    try {
      var response = await http.get(
        Uri.https(API_URL, LISTINGS_BASE),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": this.jwtToken,
        },
      );

      var body = json.decode(response.body);

      if (response is Response) {
        if (response.statusCode == 200) {
          List<Listing> listings = <Listing>[];

          body.forEach((element) {
            listings.add(Listing(
              itemId: element['item_id'],
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
      return body;
    } catch (e) {
      print(e.toString());
    }
  }
}
