import 'package:flutter/material.dart';

import 'global_vars.dart';

class ResultsPane extends StatefulWidget {
  const ResultsPane({Key? key}) : super(key: key);

  @override
  State<ResultsPane> createState() => _ResultsPaneState();
}

class _ResultsPaneState extends State<ResultsPane> {
  @override
  Widget build(BuildContext context) {
    if(isInputFormValidated)
      {
        return const Text("Ready to calculate");
      }
    return const Text("Not all fields contain data");
  }
}
