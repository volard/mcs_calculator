import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/components/simple_tex_view.dart';

class EquationPipeline extends StatefulWidget {
  EquationPipeline(
      {Key? key,
      required this.splitButtonNames,
      required this.pipelines})
      : super(key: key)
  {
    assert(splitButtonNames.length == pipelines.length);
  }

  final List<String> splitButtonNames;
  final List<List<String>> pipelines;

  @override
  State<EquationPipeline> createState() => _EquationPipelineState();
}

class _EquationPipelineState extends State<EquationPipeline> {
  int indexPipeline = 0;
  List<Widget> texDocs = [];

  @override
  Widget build(BuildContext context) {

    void getEquations(){
      texDocs.clear();
      for(var formula in widget.pipelines[indexPipeline]){
        texDocs.add(simpleTexView(context: context, content: formula));
      }
    }

    if (texDocs.isEmpty) getEquations();

    List<ButtonSegment<int>> segmentedButtons = [];
    int i = 0;
    for (var name in widget.splitButtonNames){
      segmentedButtons.add(
          ButtonSegment<int>(
              value: i,
              label: Text(name),)
      );
      i += 1;
    }


    return Column(
      children: [
        SegmentedButton<int>(
          segments: segmentedButtons,
          selected: <int>{indexPipeline},
          onSelectionChanged: (Set<int> newSelection) {
            setState(() {
              // By default there is only a single segment that can be
              // selected at one time, so its value is always the first
              // item in the selected set.
              indexPipeline = newSelection.first;
              getEquations();
            });
          },
        ),
        Column(
          children: texDocs,
        )

      ],
    );
  }
}
