import 'package:flutter/material.dart';
import '../models/view.dart';

final ShoppingListView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: 'shopping',
);

final _body = Center(
  child: Container(
    color: Colors.redAccent,
  ),
);

final _leadingAction = Text('list');