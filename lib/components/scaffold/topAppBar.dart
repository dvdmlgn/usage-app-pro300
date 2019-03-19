import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:usage/app/appRoot.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/components/auth/sign_in.dart';
import 'package:usage/models/recipe.dart';
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
  onPressed: () {
    Navigator.push(AppRoot.context, MaterialPageRoute(builder: (context) => SignIn()));
  },
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
      return _infoBtn;
    }
    return snapshot.data.leadingAction;
  },
);

final _infoBtn = IconButton(
    icon: Icon(Icons.info_outline),
    color: Colors.teal,
    onPressed: () {
      fetchRecipes();
    });

Future<void> fetchRecipes() async {
  String ingredients = '';
  for (var item in expiringItems) {
    ingredients = ingredients + item.name + '%2';
  }
  ingredients = ingredients.substring(0, ingredients.length - 2);
  print("INGREDIENTS:$ingredients");
  print(
      'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=1&ranking=1&ingredients=$ingredients');
  final response = await http.get(
    'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=1&ranking=1&ingredients=$ingredients',
    headers: {
      "X-RapidAPI-Key": "1481a03de5msh28f3feff25c9eb5p1cbf6ajsn4929d15b536a"
    },
  );
  final responseJson = json.decode(response.body);
  print(responseJson);
}
