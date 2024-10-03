import 'package:feed_back_app/feed_back_page.dart';
import 'package:feed_back_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Global.screenStates.stream,
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.data?.newValue == FeedbackScreenStates.intialScreen) {
          return InitialScreen();
        } else {
          return FeedBackPage();
        }
      },
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("How do you evaluate our service",
              style: GoogleFonts.lexend(
                  color: Global.accentColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          StreamBuilder(
              stream: Global.feedbackStateValue.stream,
              builder: (context, snapshot) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...Global.feedBackReaction.map((value) {
                        return FeedBackReactionWidget(
                          emojiSelectedColor: value.selectedColor,
                          emojiString: value.emojiPath,
                          isSelected:
                              snapshot.data?.newValue == value.feedStateValue,
                          onTap: () {
                            Global.feedbackStateValue.value =
                                value.feedStateValue;
                            Future.delayed(const Duration(milliseconds: 1200),
                                () {
                              Global.screenStates.value =
                                  FeedbackScreenStates.tipScreen;
                            });
                          },
                        );
                      })
                    ]);
              })
        ],
      ),
    );
  }
}

class FeedBackReactionWidget extends StatelessWidget {
  final String emojiString;
  final Color emojiSelectedColor;
  final bool isSelected;
  final VoidCallback onTap;
  const FeedBackReactionWidget({
    required this.emojiString,
    required this.emojiSelectedColor,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              width: 1.5,
              color: isSelected ? emojiSelectedColor : Colors.grey.shade300),
        ),
        child: SvgPicture.asset(
          emojiString,
          height: 50,
          color: isSelected ? emojiSelectedColor : Colors.grey.shade300,
        ),
      ),
    );
  }
}
