import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/components/equation_pipeline.dart';
import 'package:mcs_calculator/presentation/components/simple_tex_view.dart';
import 'package:mcs_calculator/presentation/resources/app_resources.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:mcs_calculator/viewmodels/type_extensions.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';

class ResultsPane extends StatefulWidget {
  const ResultsPane({Key? key}) : super(key: key);

  @override
  State<ResultsPane> createState() => _ResultsPaneState();
}

class _ResultsPaneState extends State<ResultsPane> {
  late bool localCopyOfCSModelState = false;

  @override
  Widget build(BuildContext context) {

    return Consumer<ComputingSystemModel>(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/waiting_placeholders/ryan_gosling.gif",
            )
        ),
      ), builder: (context, model, child) {
        if (!model.isReadyToCalculate()) {
          return child!;
        } else {
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
                    trailing: Text(model.loadFactor.roundTo(Constants.doubleRoundPrecise).toString())
                ),
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
                    trailing: Text(model.loadFactor.roundTo(Constants.doubleRoundPrecise).toString())
                        ),
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
                    trailing: Text(model.queueLength.roundTo(Constants.doubleRoundPrecise).toString())),
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
                    trailing: Text(model.requestsQuantity.roundTo(Constants.doubleRoundPrecise).toString())),
                ListTile(
                  title: Text(S.of(context).stateProbabilities),
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          showDragHandle: true,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
                              child: Text(S.of(context).PiThDescription),
                            );
                          });
                    },
                    icon: const Icon(Icons.info_outlined),
                  ),
                  onTap: () {
                    var localP_is = model.pIs;
                    if (localP_is.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Not calculated'),
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal:10.0,),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      return;
                    }

                    List<ListTile> valuesList = [];
                    for (int i = 0; i < localP_is.length; i++) {
                      valuesList.add(ListTile(
                        title: Text("P$i", style: const TextStyle(fontFeatures: [
                          FontFeature.subscripts(),
                        ],),),
                        trailing: Text(localP_is[i].toString()),
                      ));
                    }
                    showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) {
                          return ListView(
                            padding: const EdgeInsets.all(8),
                            children: valuesList,
                          );
                        });
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
