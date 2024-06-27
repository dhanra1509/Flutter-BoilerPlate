import 'package:flutter/material.dart';
import 'package:{{name}}/constants/index.dart';

class Styles {
  Styles._();
  static textstyle(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colors.bgInverse,
        fontSize: FontSize.medium,
        fontFamily: Fonts.roboto);
  }
}
