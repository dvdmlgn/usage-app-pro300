import 'package:flutter/material.dart';
import 'package:usage/components/icons.dart';

class Fab extends StatelessWidget {
  const Fab(
      {Key key, @required this.icon, @required this.type, @required this.fn})
      : super(key: key);
  final icons icon;
  final String type;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: AppIcon(
        icon: icon,
      ),
      tooltip: 'Add $type',
      onPressed: fn,
    );
  }
}
