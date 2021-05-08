import 'package:flutter/material.dart';
import 'package:skinstonks_mobile/constants/ui.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({
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
    TextStyle textStyle = TextStyle(
      color: kWhite,
      fontWeight: FontWeight.bold,
    );

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextButton(
        onPressed: () {}, // TODO: Open Listing details screen
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(kPrimaryTextColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(14)),
          elevation: MaterialStateProperty.all<double>(15),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryLightColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.network(
                this.imageUrl,
                width: 60,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      this.name,
                      style: textStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${this.price}',
                        style: textStyle.copyWith(
                          color: kPrimaryTextColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFF4FD69C),
                        ),
                        child: Text(
                          '\$${this.potentialProfit.toStringAsFixed(2)}',
                          style: textStyle.copyWith(
                            fontSize: 13,
                            color: Color(0xFF2E5B50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
