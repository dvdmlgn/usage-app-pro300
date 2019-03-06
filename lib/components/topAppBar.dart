import 'package:flutter/material.dart';

import '../app/appState.dart';
import '../app/viewStore.dart';

final topAppBar = AppBar(
  brightness: Brightness.light,
  backgroundColor: Colors.grey[100],
  elevation: 0.0,
  actions: [
    Text('hello', style: TextStyle(color: Colors.black),),
    _notificationBell,
    _avatar
  ],
);

// final topAppBar = StreamBuilder(
//   stream: AppState.activeView,
//   // we want to move this to elsewhere in the codebase
//   // once we figure out a viable means to do so.
//   // - david (4 - march - 19)
//   initialData: views['inventory'],
//   builder: (builder, snapshot) {
//     // return AppBar(
//     //    brightness: Brightness.light,
//     //     backgroundColor: Colors.grey[100],
//     //     elevation: 0.0,
//     //     actions: [
//     //       snapshot.data.leadingAction,
//     //       _notificationBell,
//     //       _avatar
//     //     ],
//     // );
//   },
// );

// class TopAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: AppState.activeView,
//       initialData: views['inventory'],
//       builder: (builder, snapshot) {
//         return AppBar(
//           brightness: Brightness.light,
//             backgroundColor: Colors.grey[100],
//             elevation: 0.0,
//             actions: [
//               snapshot.data.leadingAction,
//               _notificationBell,
//               _avatar
//             ],
//         );

//       },
//     );
//   }
// }



// final _leadingAction = IconButton(
//   icon: Icon(
//     Icons.spa,
//     color: Colors.teal,
//   ),
//   onPressed: () => debugPrint('pressed on leading action'),
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