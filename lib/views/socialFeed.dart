import 'package:flutter/material.dart';
import '../models/view.dart';

final SocialFeedView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: 'social'
);

final _body = Center(
  child: Container(
    color: Colors.blue,
  ),
);

final _leadingAction = Text('feed');