import 'package:flutter/material.dart';
import 'package:{{name}}/constants/index.dart';

class Styles {
  Styles._();

  static const TextStyle hintStyle =
      TextStyle(color: Colors.grey, fontFamily: Fonts.roboto);
  static const TextStyle errorStyle =
      TextStyle(fontFamily: Fonts.roboto, color: Colors.red);
  static OutlineInputBorder borderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade400),
    borderRadius: BorderRadius.circular(5),
  );

  static OutlineInputBorder focusedBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colors.bg),
        borderRadius: BorderRadius.circular(5));
  }
}
