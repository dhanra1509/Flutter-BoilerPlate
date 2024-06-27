import 'package:{{name}}/constants/index.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static btnStyle(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colors.customColor1,
      borderRadius: BorderRadius.zero,
    );
  }

  static btnstyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colors.customColor3,
        padding: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(side: BorderSide.none));
  }
}
