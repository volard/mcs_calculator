import 'package:flutter/material.dart';
import 'package:mcs_calculator/presentation/components/cs_param_textfield.dart';
import 'package:mcs_calculator/presentation/components/simple_tex_view.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
import 'package:mcs_calculator/viewmodels/type_extensions.dart';
import 'package:provider/provider.dart';
import 'package:mcs_calculator/generated/l10n.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({Key? key}) : super(key: key);

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ComputingSystemModel csmProvider =
        Provider.of<ComputingSystemModel>(context, listen: false);

    void onTextChangedHandler(String? text) {
      // Validate will return true if the form is valid AVV
      if (_formKey.currentState!.validate()) {
        csmProvider.calculate();
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          csParamTextField(
              context: context,
              onChangeTextHandler: (value) {
                Provider.of<ComputingSystemModel>(context, listen: false)
                    .inputStreamIntensity = double.parse(value);

                if(value.isEmpty)
              },
              customInitialValue:
                  Provider.of<ComputingSystemModel>(context, listen: false)
                      .inputStreamIntensity
                      ?.toInputFieldString(),
              labelTextCustom: S.of(context).inputStreamIntensity,
              helpInformationBuilder: (BuildContext context) {
                return simpleTexView(
                    context: context,
                    content: S.of(context).inputStreamIntensityDescription);
              }),
          csParamTextField(
              context: context,
              onChangeTextHandler: (value) {
                Provider.of<ComputingSystemModel>(context, listen: false).serviceTime =
                    double.parse(value);
              },
              helpInformationBuilder: (BuildContext context) {
                return simpleTexView(
                    context: context,
                    content: S.of(context).serviceTimeDescription);
              },
              labelTextCustom: S.of(context).serviceTime,
              customInitialValue:
                  Provider.of<ComputingSystemModel>(context, listen: false)
                      .serviceTime
                      .toInputFieldString(),),
          csParamTextField(
            context: context,
            onChangeTextHandler: (value) {
              Provider.of<ComputingSystemModel>(context, listen: false).channelsQuantity =
                  double.parse(value);
            },
            customInitialValue:
                Provider.of<ComputingSystemModel>(context, listen: false)
                    .channelsQuantity
                    ?.toInputFieldString(),
            labelTextCustom: S.of(context).channelsQuantity,
            helpInformationBuilder: (BuildContext context) {
              return simpleTexView(
                  context: context,
                  content: S.of(context).channelsQuantityDescription);
            },
          ),
          csParamTextField(
              context: context,
              onChangeTextHandler: (value) {
                Provider.of<ComputingSystemModel>(context, listen: false)
                    .pendingCapacity = double.parse(value);
              },
              customInitialValue:
                  Provider.of<ComputingSystemModel>(context, listen: false)
                      .pendingCapacity
                      ?.toInputFieldString(),
              labelTextCustom: S.of(context).pendingCapacity,
              helpInformationBuilder: (BuildContext context) {
                return simpleTexView(
                    context: context,
                    content: S.of(context).pendingCapacityDescription);
              }),
        ],
      ),
    );
  }
}
