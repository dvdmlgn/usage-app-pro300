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
import 'package:url_launcher/url_launcher.dart';
import 'package:usage/backend/notifications.dart';
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
  onPressed: () => showNotification(),
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
  // print("INGREDIENTS:$ingredients");
  final response1 = await http.get(
    'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=2&ranking=1&ingredients=$ingredients',
    headers: {
      "X-RapidAPI-Key": "1481a03de5msh28f3feff25c9eb5p1cbf6ajsn4929d15b536a"
    },
  );
  final responseJson1 = json.decode(response1.body);
  var firstItem = responseJson1[0]['id'];
  final String recipeImg = responseJson1[0]['image'];
  final String recipeTitle = responseJson1[0]['title'];
  final response2 = await http.get(
    "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/$firstItem/information",
    headers: {
      "X-RapidAPI-Key": "aa221b911fmsh9fe2cacdb502850p1ac75bjsnb6296e327e55"
    },
  );

  final responseJson2 = json.decode(response2.body);
  final String recipeUrl = responseJson2['sourceUrl'];

  print(recipeUrl);

  showDialog(
      context: AppRoot.context,
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Container(
                  height: 40.0,
                  width: 40.0,
                  child: Image.network(
                    recipeImg,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(recipeTitle),
                subtitle: Text(recipeUrl),
              ),
              ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Go To Recipe'),
                      onPressed: () {
                        _launchURL(recipeUrl);
                      },
                    ),
                    FlatButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.pop(AppRoot.context);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
