import 'package:flutter/material.dart';
import 'styles.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final int? maxlines;
  final TextAlign? textAlign;
  // final TextScaler? textScaler; // If this is a custom type, define it or remove it if not needed

  const TextComponent({
    super.key,
    required this.text,
    this.textStyle,
    this.maxlines,
    this.textAlign,
    // this.textScaler,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxlines,
      // textScaler: textScaler, // Uncomment or remove based on actual use
      style: textStyle?.copyWith(
            color: textStyle?.color ?? Styles.textstyle(context).color,
            fontSize: textStyle?.fontSize ?? Styles.textstyle(context).fontSize,
            fontFamily:
                textStyle?.fontFamily ?? Styles.textstyle(context).fontFamily,
            fontWeight:
                textStyle?.fontWeight ?? Styles.textstyle(context).fontWeight,
            backgroundColor: textStyle?.backgroundColor ??
                Styles.textstyle(context).backgroundColor,
            wordSpacing:
                textStyle?.wordSpacing ?? Styles.textstyle(context).wordSpacing,
            letterSpacing: textStyle?.letterSpacing ??
                Styles.textstyle(context).letterSpacing,
            overflow: textStyle?.overflow ?? Styles.textstyle(context).overflow,
          ) ??
          Styles.textstyle(context),
    );
  }
}
