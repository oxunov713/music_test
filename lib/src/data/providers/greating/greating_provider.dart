import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/tools/greating.dart';

class GreatingViewModel extends ChangeNotifier {
  String greating = Greating.goodMorning.greating;

  changeGreating() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var now = DateTime.now();
      var hour = now.hour;

      if (hour >= 6 && hour < 12) {
        greating = Greating.goodMorning.greating;
      } else if (hour >= 12 && hour < 17) {
        greating = Greating.goodAfternoon.greating;
      } else if (hour >= 17 && hour < 20) {
        greating = Greating.goodEvening.greating;
      } else {
        greating = Greating.goodNight.greating;
      }

      notifyListeners();
    });
  }
}
