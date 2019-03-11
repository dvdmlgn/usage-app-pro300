import 'package:flutter/material.dart';
import 'package:usage/app/appState.dart';
import 'package:usage/components/social/socialFeed.dart';
import '../models/view.dart';
import 'package:usage/components/shared/icons.dart';
import 'package:usage/components/shared/fab.dart';

final socialFeedView = View(
    leadingAction: _leadingAction,
    body: _body,
    section: _section,
    fab: _fab,
    meta: _meta);

final _fab = Fab(
  icon: icons.add,
  //type: 'Post',
  fn: () {},
);

final _body = SocialFeed();

final _leadingAction = Switch(
    value: false,
    onChanged: (_) {
      AppState.setActiveView('social saved');
    });

final _meta = null;

final _section = sections.social;
