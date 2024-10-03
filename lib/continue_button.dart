import 'package:feed_back_app/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Container(
          height: MediaQuery.of(context).size.height / 14,
          child: Center(
            child: Text(
              "Continue without tip >>",
              style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              color: Global.brandColor,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
