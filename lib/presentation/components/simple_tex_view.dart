import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:mcs_calculator/main.dart';

Widget simpleTexView({required BuildContext context, required String content}) {
  var textColor;

  if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light) {
    textColor = "101111";
  } else {
    textColor = "cde1f2";
  }

  return TeXView(
      child: TeXViewDocument(content,
          style: TeXViewStyle.fromCSS("color: #$textColor; padding: 15px")));
}
