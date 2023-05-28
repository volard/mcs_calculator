import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

Widget csParamTextField(
    {required void Function(String) onChangeTextHandler,
    required void Function() onHelpIconPressedHandler,
    required String labelTextCustom,
    required int maxLengthCustom,
    TextInputType keyboardTypeCustom = TextInputType.text}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        TextFormField(
          key: const Key('intensityInput'),
          maxLength: maxLengthCustom,
          keyboardType: keyboardTypeCustom,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            counterText: "",
            labelText: labelTextCustom,
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return S.current.noInputErrorLabelText;
            }
            return null;
          },
          onChanged: onChangeTextHandler,
        ),
        Positioned(
          top: 7,
          right: 0,
          child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.info_outline),
              onPressed: onHelpIconPressedHandler
              ),
        ),
      ],
    ),
  );
}
