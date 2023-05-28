import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import '../../data/colors_helper.dart';

Widget simpleTexView({required BuildContext context, required String content}) {
  return TeXView(
      child: TeXViewDocument(content,
          style: TeXViewStyle.fromCSS(
              "color: #${invertColor(Theme.of(context).primaryColor).value.toRadixString(16).substring(2)}; padding: 15px")));
}