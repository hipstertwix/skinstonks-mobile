import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';
import 'package:skinstonks_mobile/screens/home/listings/components/swipe_cards.dart';

class ListingsCardsStack extends StatefulWidget {
  @override
  _ListingsCardsStackState createState() => _ListingsCardsStackState();
}

class _ListingsCardsStackState extends State<ListingsCardsStack> {
  int frontCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CardController controller;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.07),
      height: size.height * 0.6,
      child: new SwipeCards(
        allowVerticalMovement: false,
        orientation: AmassOrientation.top,
        totalNum: 10,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: size.width - (kSidePadding * 2),
        maxHeight: size.width * 0.97,
        minWidth: size.width * 0.75,
        minHeight: 380,
        cardBuilder: (context, index) => ListingCard(),
        cardController: controller = CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          if (align.x < 0) {
            // SWIPING LEFT
          } else if (align.x > 0) {
            // SWIPING RIGHT
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          if (orientation != CardSwipeOrientation.recover)
            setState(() {
              frontCardIndex = index + 1;
            });
        },
      ),
    );
  }
}

class ListingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 15),
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
                child: Image.asset(
                  'assets/images/test.png',
                  width: 190,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'M9 Bayonet | Doppler',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '€7,103.00',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
