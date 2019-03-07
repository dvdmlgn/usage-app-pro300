import 'package:flutter/material.dart';
import 'package:usage/app/appState.dart';
import 'package:usage/components/social/socialSaved.dart';
import '../models/view.dart';

final socialSavedView =
    View(leadingAction: _leadingAction, body: _body, section: sections.social);

final _body = SavedPosts();

final _leadingAction = Switch(value: false, onChanged: (_){
    AppState.setActiveView('social feed');
});
