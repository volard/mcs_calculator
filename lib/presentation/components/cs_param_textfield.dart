import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

const defaultMaxLength = 7;
const defaultTextInputType = TextInputType.numberWithOptions(decimal: true);

Widget csParamTextField(
    {required void Function(String) onChangeTextHandler,
    required String labelTextCustom,
    required BuildContext context,
    required Widget Function(BuildContext context) helpInformationBuilder,
    String? customInitialValue,
    int maxLengthCustom = defaultMaxLength,
    TextInputType keyboardTypeCustom = defaultTextInputType}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: UniqueKey(),
          initialValue: customInitialValue,
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
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  showDragHandle: true,
                  isDismissible: true,
                  builder: helpInformationBuilder,
                );
              }),
        ),
      ],
    ),
  );
}
