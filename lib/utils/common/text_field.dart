import 'package:flutter/material.dart';
import 'package:tribe/utils/common/colors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditController;
  final bool secureText;
  final textType;
  final label;
  final Function textFieldValue;

  const TextInputField(
      {@required this.textEditController,
      @required this.secureText,
      @required this.textType,
      @required this.label,
      @required this.textFieldValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditController,
        textInputAction: TextInputAction.next,
        autovalidate: false,
        autocorrect: false,
        onSaved: (value) => textFieldValue(value),
        keyboardType: textType,
        obscureText: secureText,
        // validator: (_) {
        //   return !state.isEmailValid ? 'Please enter valid email' : null;
        // },
        decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 0.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 0.3),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 0.3),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tribeErrorRed, width: 0.3),
          ),
          labelText: label,
        ),
      ),
    );
  }
}
