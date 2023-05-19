import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

Widget loadFactorPage({required BuildContext context}) {
  if (kDebugMode) {
    // print("${Theme.of(context).focusColor.value.toRadixString(16)} ");
  }
  String colorText = Theme.of(context).primaryTextTheme.bodyMedium?.color?.value.toRadixString(16) ?? "000000";
  print(colorText);
  return Column(
    children: [
      const Text("Load factor info"),
      TeXView(
        child: TeXViewColumn(children: [
          TeXViewInkWell(
            id: "id_0",
            child: TeXViewColumn(children: [
              TeXViewDocument(r"""<p>                                
                                 Вау тут и поо-русски можно \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                                 $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
                  style: TeXViewStyle.fromCSS("color: #$colorText;"))
            ]),
          )
        ]),
      ),
    ],
  );
}
