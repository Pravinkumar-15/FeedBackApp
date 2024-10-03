import 'package:flutter/material.dart';
import 'package:fluxivity/fluxivity.dart';

enum FeedBackStateValue { sad, neutral, smile, excited }

enum TipLevelState { level1, level2, level3, custom }

class FeedBackReaction {
  String emojiPath;
  Color selectedColor;
  FeedBackStateValue feedStateValue;
  FeedBackReaction({
    required this.selectedColor,
    required this.emojiPath,
    required this.feedStateValue,
  });
}

class Global {
  static Color brandColor = Color(0xffC8102E);
  static Color accentColor = Color(0xFF231E21);
  static Color backgroundColor = Color(0xFFE0DFDF);
  static Reactive<FeedbackScreenStates> screenStates =
      Reactive(FeedbackScreenStates.intialScreen);
  static List<FeedBackReaction> feedBackReaction = [
    FeedBackReaction(
      emojiPath: "assets/sad.svg",
      selectedColor: Colors.red,
      feedStateValue: FeedBackStateValue.sad,
    ),
    FeedBackReaction(
      emojiPath: "assets/iconly_svg_optimized-optimized (1).svg",
      selectedColor: Colors.yellow,
      feedStateValue: FeedBackStateValue.smile,
    ),
    FeedBackReaction(
      emojiPath: "assets/smiling-black-icon.svg",
      selectedColor: Colors.orange,
      feedStateValue: FeedBackStateValue.neutral,
    ),
    FeedBackReaction(
      emojiPath: "assets/happy.svg",
      selectedColor: Colors.green,
      feedStateValue: FeedBackStateValue.excited,
    ),
  ];
  static Reactive<FeedBackStateValue?> feedbackStateValue = Reactive(null);
  static Reactive<TipLevelState?> tipLevelState = Reactive(null);
  // static Reactive<bool> isSelectedExpression = Reactive(false);
  // static Reactive<bool> isSelectedSmileExpression = Reactive(false);
  // static Reactive<bool> isSelectedHappyExpression = Reactive(false);
  // static bool isSeletectedSad = false;
}

enum FeedbackScreenStates { intialScreen, tipScreen }
