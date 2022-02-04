import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// this is the helper class to minimize redundancy of using MediaQuery all the time for responsiveness
class ScreenSize {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
