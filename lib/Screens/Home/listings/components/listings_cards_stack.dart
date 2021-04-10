import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/models/listing/listing.dart';
import 'package:skinstonks_mobile/providers/listings.dart';
import 'package:skinstonks_mobile/screens/home/listings/components/listing_card.dart';
import 'package:skinstonks_mobile/screens/home/listings/components/swipe_cards.dart';
import 'package:skinstonks_mobile/widgets/loading_ring.dart';

class ListingsCardsStack extends StatefulWidget {
  @override
  _ListingsCardsStackState createState() => _ListingsCardsStackState();
}

class _ListingsCardsStackState extends State<ListingsCardsStack> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CardController controller;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.07),
      height: size.height * 0.6,
      child: Consumer<Listings>(
        builder: (context, listingsProvider, child) {
          List<Listing>? listings = listingsProvider.get;
          if (listings == null) {
            return LoadingRing(
              color: kPrimaryLightColor,
              size: 33,
              lineWidth: 5,
            );
          }
          if (listings.isNotEmpty) {
            return SwipeCards(
              animDuration: 600,
              allowVerticalMovement: false,
              orientation: AmassOrientation.top,
              totalNum: listings.length,
              stackNum: 4,
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
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                if (orientation == CardSwipeOrientation.right) {
                  listingsProvider.swipe(listings[index], true);
                } else if (orientation == CardSwipeOrientation.left) {
                  listingsProvider.swipe(listings[index], false);
                }
              },
            );
          } else {
            return Text('No more listings to display.');
          }
        },
      ),
    );
  }
}
