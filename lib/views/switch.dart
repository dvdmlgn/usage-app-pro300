import 'package:flutter/material.dart';

class LeadingActionSwitch extends StatelessWidget {
  const LeadingActionSwitch({Key key, @required this.value, @required this.fn})
      : super(key: key);
  final bool value;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: fn,
    );
  }
}
