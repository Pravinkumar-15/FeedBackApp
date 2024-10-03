// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:feed_back_app/global.dart';
import 'package:google_fonts/google_fonts.dart';

class TipLevelWidget extends StatelessWidget {
  List<TipLevelData> tipsData = [
    TipLevelData(
        previewAmount: "29 SEK",
        percentage: "5%",
        isSelectedTipLevel: TipLevelState.level1,
        selectedColor: Global.brandColor,
        selectedTextColor: Global.accentColor),
    TipLevelData(
        previewAmount: "58 SEK",
        percentage: "10%",
        isSelectedTipLevel: TipLevelState.level2,
        selectedColor: Global.brandColor,
        selectedTextColor: Global.accentColor),
    TipLevelData(
        previewAmount: "87 SEK",
        percentage: "15%",
        isSelectedTipLevel: TipLevelState.level3,
        selectedColor: Global.brandColor,
        selectedTextColor: Global.accentColor),
    TipLevelData(
        previewAmount: "custom",
        percentage: "...",
        isSelectedTipLevel: TipLevelState.custom,
        selectedColor: Global.brandColor,
        selectedTextColor: Global.accentColor),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Global.tipLevelState.stream,
        builder: (context, snapshot) {
          return Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...tipsData.map((value) {
                return TipLevels(
                    onTap: () {
                      if (value.isSelectedTipLevel == TipLevelState.custom) {
                        _showCustomTipModel(context);
                      }
                      Global.tipLevelState.value = value.isSelectedTipLevel;
                    },
                    isSelected:
                        snapshot.data?.newValue == value.isSelectedTipLevel,
                    selectedColor: Global.accentColor,
                    percentage: value.percentage ?? "",
                    previewAmount: value.previewAmount ?? "");
              })
            ],
          ));
        });
  }
}

class TipLevels extends StatelessWidget {
  final String percentage;
  final String previewAmount;
  final Color selectedColor;
  final bool isSelected;
  final VoidCallback onTap;
  const TipLevels(
      {super.key,
      required this.percentage,
      required this.previewAmount,
      required this.isSelected,
      required this.selectedColor,
      required this.onTap});
  @override
  Widget build(BuildContext) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isSelected ? Global.brandColor : Colors.transparent,
            border: Border.all(
                color: isSelected ? Global.brandColor : Global.accentColor,
                width: 1)),
        child: Column(
          children: [
            Text(percentage,
                style: GoogleFonts.lexend(
                    color: isSelected ? Colors.white : Global.accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text(previewAmount,
                style: GoogleFonts.lexend(
                    color: isSelected ? Colors.white : Global.accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class TipLevelData {
  String? percentage;
  String? previewAmount;
  TipLevelState? isSelectedTipLevel;
  Color? selectedColor;
  Color? selectedTextColor;

  TipLevelData({
    this.percentage,
    this.previewAmount,
    this.isSelectedTipLevel,
    this.selectedColor,
    this.selectedTextColor,
  });
}

_showCustomTipModel(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Wrap(
            children: [
              _sbCloseButton(context),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.width / 1.55,
                // width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  children: [
                    Text(
                      "Add custom tip",
                      style: GoogleFonts.lexend(
                          color: Global.accentColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buidCustomTextField(context),
                    buildPayButton(context),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        );
      });
}

Widget buidCustomTextField(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Global.accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
          enabled: true,
          showCursor: true,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
          ],
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 8),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: "0",
              suffix: Text(
                'in SEK',
                style: TextStyle(
                    color: Global.accentColor.withOpacity(0.2),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              hintStyle: TextStyle(
                  color: Global.accentColor.withOpacity(0.2),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          style: GoogleFonts.lexend(
              color: Global.accentColor,
              fontSize: 12,
              fontWeight: FontWeight.bold)),
    ),
  );
}

Widget buildPayButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Global.brandColor,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pay now',
          style: GoogleFonts.lexend(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          '580 SEK',
          style: GoogleFonts.lexend(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget _sbCloseButton(BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red,
            child: SvgPicture.asset(
              "assets/close_icon.svg",
              color: Colors.white,
              width: 30,
            ),
          ),
        ),
      ),
    ),
  );
}
