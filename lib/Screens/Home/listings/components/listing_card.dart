import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

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
