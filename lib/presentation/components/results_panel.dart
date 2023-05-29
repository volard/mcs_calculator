import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/components/equation_pipeline.dart';
import 'package:mcs_calculator/presentation/components/simple_tex_view.dart';
import 'package:mcs_calculator/presentation/resources/app_resources.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';

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
        if (model.isCalculated) {
          return const Text("Ready to calculate");
        }
        return Card(
          child: Column(
            children: [
              ListTile(
                  title: Text(S.of(context).loadFactor),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      showDragHandle: true,
                      isDismissible: true,
                      builder: (BuildContext context) {
                        return simpleTexView(
                            context: context,
                            content: loadFactorDescription(context));
                      },
                    );
                  },
                  trailing: const Text("4,38")),
              ListTile(
                  title: Text(S.of(context).avgPendingTime),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      showDragHandle: true,
                      builder: (context) => DraggableScrollableSheet(
                        maxChildSize: Constants.maxChildSizeScrollableSheet,
                        expand: false,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              EquationPipeline(splitButtonNames: [
                                S.of(context).finite,
                                S.of(context).infinite
                              ], pipelines: [
                                [
                                  avgPendingTimeDescription(context),
                                  absoluteThroughputDescription(context),
                                  relativeThroughputDescription(context),
                                  requestRejectionProbabilityDescription(
                                      context),
                                  PnmDescription(context),
                                  pZeroDescription(context)
                                ],
                                [
                                  avgPendingTimeDescription(context),
                                  absoluteThroughputDescription(context),
                                  relativeThroughputDescriptionInfinity(
                                      context),
                                  requestRejectionProbabilityDescriptionInfinity(
                                      context),
                                  PnmDescription(context),
                                  pZeroDescriptionInfinity(context)
                                ]
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  trailing: const Text("4,38")),
              ListTile(
                  title: Text(S.of(context).queueLength),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      showDragHandle: true,
                      builder: (context) => DraggableScrollableSheet(
                        maxChildSize: Constants.maxChildSizeScrollableSheet,
                        expand: false,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              EquationPipeline(splitButtonNames: [
                                S.of(context).finite,
                                S.of(context).infinite
                              ], pipelines: [
                                [
                                  queueLengthDescription(context),
                                  pZeroDescription(context)
                                ],
                                [
                                  queueLengthDescriptionInfinity(context),
                                  P_queueDescription(context),
                                  pZeroDescriptionInfinity(context)
                                ]
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  trailing: const Text("4,38")),
              ListTile(
                  title: Text(S.of(context).requestsQuantity),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      showDragHandle: true,
                      builder: (context) => DraggableScrollableSheet(
                        maxChildSize: Constants.maxChildSizeScrollableSheet,
                        expand: false,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              EquationPipeline(splitButtonNames: [
                                S.of(context).finite,
                                S.of(context).infinite
                              ], pipelines: [
                                [
                                  requestsQuantityDescription(context),
                                  queueLengthDescription(context),
                                  pZeroDescription(context),
                                  relativeThroughputDescription(context),
                                  requestRejectionProbabilityDescription(
                                      context),
                                  PnmDescription(context),
                                  pZeroDescription(context)
                                ],
                                [
                                  requestsQuantityDescription(context),
                                  queueLengthDescriptionInfinity(context),
                                  P_queueDescription(context),
                                  pZeroDescriptionInfinity(context),
                                  relativeThroughputDescriptionInfinity(
                                      context),
                                  requestRejectionProbabilityDescriptionInfinity(
                                      context)
                                ]
                              ]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  trailing: const Text("4,38")),
              ListTile(
                  title: Text(S.of(context).stateProbabilities),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          showDragHandle: true,
                          builder: (context) {
                            return Text(S.of(context).PiThDescription);
                          });
                    },
                    icon: const Icon(Icons.info_outlined),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          ListView(){
                            
                          }
                        });
                  },
                ),
            ],
          ),
        );
      },
    );

    //
  }
}
