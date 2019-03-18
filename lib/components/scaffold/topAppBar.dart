import 'package:flutter/material.dart';
import 'package:usage/models/view.dart';

import '../../app/appState.dart';
import '../../app/viewStore.dart';

final topAppBar = AppBar(
  brightness: Brightness.light,
  backgroundColor: Colors.grey[100],
  elevation: 0.0,
  actions: [_leading, _notificationBell, _avatar],
);

// Widget topAppBar() => StreamBuilder(
//   stream: AppState.activeView,
//   initialData: views['inventory'],
//   builder: (builder, snapshot) {
//     return AppBar(
//       leading: snapshot.data.leadingAction,
//       actions: [
//         _notificationBell,
//         _avatar,
//       ],
//     );
//   },
// );

final _notificationBell = IconButton(
  icon: Icon(
    Icons.notifications_none,
    color: Colors.teal,
  ),
  onPressed: () => debugPrint('pressed on notifications'),
);

final _avatar = IconButton(
  icon: Icon(
    Icons.person,
    color: Colors.teal,
  ),
  onPressed: () => debugPrint('pressed on avatar'),
);

// final _leading = Container(
//   color: Colors.pink,
//   width: 200,
// );

final StreamBuilder<View> _leading = StreamBuilder(
  stream: AppState.activeView,
  initialData: views['inventory'],
  builder: (builder, snapshot) {
    if (snapshot.data.leadingAction == null) {
      return Text('');
    }
    return snapshot.data.leadingAction;
  },
);
