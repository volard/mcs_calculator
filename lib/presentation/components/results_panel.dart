import 'package:flutter/material.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:provider/provider.dart';

class ResultsPane extends StatefulWidget {
  const ResultsPane({Key? key}) : super(key: key);

  @override
  State<ResultsPane> createState() => _ResultsPaneState();
}

class _ResultsPaneState extends State<ResultsPane> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ComputingSystemModel>(
        builder: (context, model, child) {
          if(model.isCalculated) {
            return const Text("Ready to calculate");
          }
          return const Text("Not all fields contain data");
        },

    );

    //
  }
}
