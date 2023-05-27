import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mcs_calculator/data/colors_helper.dart';
import 'package:mcs_calculator/main.dart';

String some = r"""
<p>
   <br> \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
  $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$
</p>
""";