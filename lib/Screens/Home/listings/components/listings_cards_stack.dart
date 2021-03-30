import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/screens/home/listings/components/swipe_cards.dart';
import 'package:skinstonks_mobile/services/auth.dart';
import 'package:skinstonks_mobile/services/database.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';

class ListingsCardsStack extends StatefulWidget {
  @override
  _ListingsCardsStackState createState() => _ListingsCardsStackState();
}

class _ListingsCardsStackState extends State<ListingsCardsStack> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final DatabaseService? _databaseService = Provider.of<DatabaseService?>(context);
    Size size = MediaQuery.of(context).size;
    CardController controller;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.07),
      height: size.height * 0.6,
      child: FutureBuilder<dynamic>(
        future: _databaseService != null ? _databaseService.getListings() : null,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingRing(
              color: kPrimaryLightColor,
              size: 33,
              lineWidth: 5,
            );
          }
          if (snapshot.data is List<Listing>) {
            final listings = snapshot.data;
            return new SwipeCards(
              allowVerticalMovement: false,
              orientation: AmassOrientation.top,
              totalNum: listings.length,
              stackNum: 3,
              swipeEdge: 4.0,
              maxWidth: size.width - (kSidePadding * 2),
              maxHeight: size.width * 0.97,
              minWidth: size.width * 0.75,
              minHeight: 380,
              cardBuilder: (context, index) => ListingCard(
                name: listings[index].marketHashName,
                price: listings[index].price,
                potentialProfit: listings[index].potentialProfit,
                imageUrl: listings[index].imageUrl,
              ),
              cardController: controller = CardController(),
              swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                if (align.x < 0) {
                  // SWIPING LEFT
                } else if (align.x > 0) {
                  // SWIPING RIGHT
                }
              },
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {},
            );
          } else {
            return Text(snapshot.data['message']);
          }
        },
      ),
    );
  }
}

class ListingCard extends StatelessWidget {
  ListingCard({
    required this.name,
    required this.price,
    required this.potentialProfit,
    required this.imageUrl,
  });

  final String name;
  final double price;
  final double potentialProfit;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 15, right: 40, left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: [
                      const Color(0xFF7478D6),
                      const Color(0xFF7E82D4).withOpacity(0.7),
                      const Color(0xFF7E82D4).withOpacity(0.3),
                      const Color(0xFF595EC1).withOpacity(0.0)
                    ],
                    stops: [0.0, 0.35, 0.60, 1.0],
                  ),
                ),
                child: Image.network(
                  imageUrl,
                  width: 190,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '\$' + '$price',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
