import 'package:flutter/material.dart';
// import 'dart:async';

import 'appState.dart';
// import '../models/view.dart';
import 'viewStore.dart';

import '../components/scaffold/topAppBar.dart';
import '../components/scaffold/bottomAppBar.dart';
import 'package:usage/backend/notifications.dart';

/// the only reason this is a stateful widget is because
/// we want to dispose of the view subject from 'AppState'
/// whenever this widget is disposed of.
/// => helps with cleanup & preventing memory leaks
/// - david (4 - march - 19)
class AppRoot extends StatefulWidget {
  static BuildContext context;

  @override
  State<AppRoot> createState() => _State();
}

class _State extends State<AppRoot> {

  @override
  void initState() {
      notificationsInit();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    AppRoot.context = context;

    return StreamBuilder(
      stream: AppState.activeView,
      // we want to move this to elsewhere in the codebase
      // once we figure out a viable means to do so.
      // - david (4 - march - 19)
      initialData: views['inventory'],
      builder: (builder, snapshot) {
        // var _view = snapshot.data as View;

        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: topAppBar,
          body: snapshot.data.body,
          floatingActionButton: snapshot.data.fab,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: bottomAppBar,
        );
      },
    );
  }

  @override
  dispose() {
    // clean up memory when we aren't going to use it anymore
    AppState.disposeOfViewSubject();
    super.dispose();
  }
}
