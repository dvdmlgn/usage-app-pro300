import 'package:flutter/material.dart';
import 'package:usage/components/social/socialFeed.dart';
import '../models/view.dart';
import 'package:usage/components/icons.dart';
import 'package:usage/components/fab.dart';

final socialFeedView =
    View(
    leadingAction: _leadingAction,
    body: _body,
    section: sections.social,
    fab: _fab,
    meta: _meta
    );

final _fab = Fab(
  icon: icons.add,
  //type: 'Post',
  fn: () {}, 
);

final _body = SocialFeed();

final _leadingAction = Text('feed');

final _meta = null;

final _section = sections.social;
