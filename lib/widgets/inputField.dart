import 'package:flutter/material.dart';

class InputField {
  static inputField(double width, TextEditingController ctrl, bool editable,
      TextInputType keyboardType, String labelText, String hintText) {
    bool autoFocused = false;
    if (editable == true && labelText == 'Name') {
      autoFocused = true;
    }

    return Container(
      width: width,
      child: TextFormField(
        keyboardType: keyboardType,
        enabled: editable,
        autofocus: autoFocused,
        controller: ctrl,
        decoration: _fieldDecoration(ctrl, labelText, hintText),
      ),
      margin: EdgeInsets.all(8.0),
    );
  }

  static _fieldDecoration(
      TextEditingController ctrl, String labelText, String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      labelText: labelText,
    );
  }
}
