import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import '../../data/colors_helper.dart';

Widget simpleTexView({required BuildContext context, required String content}) {
  return TeXView(
    child: TeXViewColumn(
        style:
        const TeXViewStyle(padding: TeXViewPadding.only(left: 2, right: 2)), // TODO this shit doesn't work
        children: [
          TeXViewInkWell(
            onTap:
                (_) {}, // NOTE empty function to avoid Null checking or smth exception
            id: "id_0",
            child: TeXViewColumn(children: [
              TeXViewDocument(content,
                  style: TeXViewStyle.fromCSS(
                      "color: #${invertColor(Theme.of(context).primaryColor).value.toRadixString(16).substring(2)}; padding: 15px"))
            ]),
          )
        ]),
  );
}