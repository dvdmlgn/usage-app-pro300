import 'package:flutter/material.dart';
import '../models/view.dart';

final shoppingBasketView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: sections.shopping,
);

final _body = Center(
  child: Container(
    color: Colors.pink,
  ),
);

final _leadingAction = Text('basket');
