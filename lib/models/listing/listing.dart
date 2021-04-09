class Listing {
  final String id;
  final String marketHashName;
  final double price;
  final double potentialProfit;
  final String imageUrl;
  final String withdrawableAt;

  Listing({
    required this.id,
    required this.marketHashName,
    required this.price,
    required this.potentialProfit,
    required this.imageUrl,
    required this.withdrawableAt,
  });

  factory Listing.fromJson(Map<String, dynamic> listingJSON) {
    return Listing(
      id: listingJSON['_id'],
      marketHashName: listingJSON['marketHashName'],
      price: listingJSON['price'],
      potentialProfit: listingJSON['potentialProfit'],
      imageUrl: listingJSON['imageUrl'],
      withdrawableAt: listingJSON['withdrawableAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketHashName': marketHashName,
      'price': price,
      'potentialProfit': potentialProfit,
      'imageUrl': imageUrl,
      'withdrawableAt': withdrawableAt,
    };
  }
}
