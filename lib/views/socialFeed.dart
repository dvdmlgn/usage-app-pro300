import 'package:flutter/material.dart';
import 'package:usage/components/social/socialFeed.dart';
import '../models/view.dart';

final SocialFeedView =
    View(leadingAction: _leadingAction, body: _body, section: sections.social);

final _body = SocialFeed();

final _leadingAction = Text('feed');
