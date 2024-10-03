// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:feed_back_app/amount_widget.dart';
import 'package:feed_back_app/continue_button.dart';
import 'package:feed_back_app/tip_level_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:feed_back_app/global.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderWidget(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
          ),
          Text("Do you wish to add tip for our service",
              style: GoogleFonts.lexend(
                  color: Global.accentColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: TipLevelWidget(),
          ),
          SizedBox(
            height: 5,
          ),
          ContinueButton(),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          child: Center(
            child: SvgPicture.asset(
              "assets/heart_icon.svg",
              color: Global.brandColor,
              height: 20,
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Global.accentColor.withOpacity(0.3)),
        ),
        SizedBox(
          width: 5,
        ),
        Text("Happy with the service?",
            style: GoogleFonts.lexend(
                color: Global.accentColor,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
