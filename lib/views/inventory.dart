import 'package:flutter/material.dart';
import '../models/view.dart';

final InventoryView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: 'inventory',
);

final _body = Center(
  child: Container(
    color: Colors.amber,
  ),
);

final _leadingAction = Text('inventory');