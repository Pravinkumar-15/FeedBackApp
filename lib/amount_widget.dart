import 'package:feed_back_app/global.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Global.accentColor.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total bill",
              style: TextStyle(
                color: Global.brandColor,
                fontSize: 12,
              )),
          Text("580 SEK",
              style: TextStyle(
                  color: Global.brandColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}