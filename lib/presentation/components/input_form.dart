import 'package:flutter/material.dart';
import 'package:mcs_calculator/pages/modal_pages/input_stream_intensity.dart';
import 'package:mcs_calculator/pages/modal_pages/load_factor.dart';
import 'package:mcs_calculator/presentation/components/cs_param_textfield.dart';
import 'package:mcs_calculator/viewmodels/cs_model.dart';
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
              onChangeTextHandler: onTextChangedHandler,
              onHelpIconPressedHandler: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => inputStreamIntensityPage);
              },
              labelTextCustom: S.of(context).inputStreamIntensity,
              maxLengthCustom: 4,
              keyboardTypeCustom: TextInputType.number),

          csParamTextField(
              onChangeTextHandler: onTextChangedHandler,
              onHelpIconPressedHandler: () {
                showModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    showDragHandle: true,
                    isDismissible: true,
                    builder: (BuildContext context) {  return loadFactorPage(context: context);}
                );
              },
              labelTextCustom: S.of(context).loadFactor,
              maxLengthCustom: 4,
              keyboardTypeCustom: TextInputType.number),

        ],
      ),
    );
  }
}
