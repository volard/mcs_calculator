import 'package:flutter/material.dart';
import 'package:mcs_calculator/data/cs_model.dart';
import 'package:provider/provider.dart';

class InputFormWidget extends StatefulWidget {
  const InputFormWidget({Key? key}) : super(key: key);

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: onTextChangedHandler,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: onTextChangedHandler,
          ),
        ],
      ),
    );
  }
}
