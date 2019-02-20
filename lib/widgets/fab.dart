import 'package:flutter/material.dart';

class Fabs {
  static addListItemFab(String listItem, Function fn) {
    return FloatingActionButton(
      onPressed: fn,
      tooltip: 'Add ' + listItem,
      child: Icon(Icons.add),
    );
  }
}
