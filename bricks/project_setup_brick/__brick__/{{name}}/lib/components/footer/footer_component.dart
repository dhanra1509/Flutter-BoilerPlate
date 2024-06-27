import 'package:flutter/material.dart';
import 'package:{{name}}/constants/index.dart';
import 'styles.dart';

class FooterComponent extends StatelessWidget {
  final SizedBox? footerSize;
  final Widget child;
  final BoxDecoration? footerStyle;
  final EdgeInsetsGeometry? footerMargin;
  final EdgeInsetsGeometry? footerPadding;

  const FooterComponent({
    super.key,
    this.footerSize,
    required this.child,
    this.footerStyle,
    this.footerMargin,
    this.footerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: footerSize?.height ?? Metrics.height(context) * 0.09,
        width: double.infinity,
        child: Container(
          margin: footerMargin,
          padding: footerPadding,
          decoration: footerStyle ?? Styles.footerStyle(context),
          child: child,
        ),
      ),
    );
  }
}
