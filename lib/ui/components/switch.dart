import 'package:flutter/material.dart';

class LeadingActionSwitch extends StatelessWidget {
  const LeadingActionSwitch({
    Key key,
    @required this.value,
  }) : super(key: key);
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (_) {},
    );
  }
}
