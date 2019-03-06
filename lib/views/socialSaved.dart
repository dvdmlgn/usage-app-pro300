import 'package:flutter/material.dart';
import '../models/view.dart';

final SocialSavedView = View(
  leadingAction: _leadingAction,
  body: _body, 
  section: 'social',
);



final _body = Center(
  child: Container(
    color: Colors.green,
  ),
);

final _leadingAction = Text('saved');