import 'package:flutter/material.dart';

enum icons {
  add,
  edit,
  delete,
  close,
  notify,
  settings,
  inventory,
  shopping,
  social
}

class AppIcon extends StatelessWidget {
  const AppIcon({Key key, @required this.icon}) : super(key: key);
  final icons icon;
  @override
  Widget build(BuildContext context) {
    if (icon == icons.add) {
      return Icon(Icons.add);
    } else if (icon == icons.edit) {
      return Icon(Icons.edit);
    } else if (icon == icons.delete) {
      return Icon(Icons.delete);
    } else if (icon == icons.close) {
      return Icon(Icons.close);
    } else if (icon == icons.notify) {
      return Icon(Icons.notifications_none);
    } else if (icon == icons.settings) {
      return Icon(Icons.settings);
    } else if (icon == icons.inventory) {
      return Icon(Icons.list);
    } else if (icon == icons.shopping) {
      return Icon(Icons.store);
    } else if (icon == icons.social) {
      return Icon(Icons.chat);
    } else {
      return null;
    }
  }
}
