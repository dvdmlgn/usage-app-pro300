import 'package:flutter/material.dart';
import 'package:usage/components/shared/icons.dart';

class Fab extends StatelessWidget {
  const Fab({Key key, @required this.icon, @required this.fn})
      : super(key: key);
  final icons icon;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: AppIcon(
        icon: icon,
      ),
      onPressed: fn,
    );
  }
}
