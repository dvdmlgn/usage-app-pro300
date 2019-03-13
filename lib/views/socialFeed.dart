import 'package:flutter/material.dart';
import 'package:usage/app/appState.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/components/social/socialFeed.dart';
import '../models/view.dart';
import '../models/post.dart';
import 'package:usage/components/shared/icons.dart';
import 'package:usage/components/shared/fab.dart';
import 'package:usage/app/appRoot.dart';

final TextEditingController _titleController = new TextEditingController();
final TextEditingController _contentController = new TextEditingController();
//final TextEditingController _ratingController = new TextEditingController();
//String category;

final socialFeedView = View(
    leadingAction: _leadingAction,
    body: _body,
    section: _section,
    fab: _fab,
    meta: _meta);

final _fab = Fab(
  icon: icons.add,
  fn: () {

      showDialog(
      context: AppRoot.context,
      builder: (context) {
        return Material(
        child: AlertDialog(
      content: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Text("New Post"),
           Row(
             children: <Widget>[
               Expanded(
                 child: TextField(
                   controller: _titleController,
                   autofocus: true,
                   decoration: InputDecoration(
                     labelText: "Title",
                   ),
                 ),
               )
             ],
           ),
           Row(
             children: <Widget>[
               Expanded(
                 child: TextField(
                   controller: _contentController,
                   autofocus: true,
                   decoration: InputDecoration(
                     labelText: "Post content",
                   ),
                 ),
               ),
             ],
           ),
         ],
       ),
     ),
     actions: <Widget>[
       FlatButton(
           onPressed: () {
            //  _getPost(_titleController.text, int.parse(_ratingController.text),
            //_contentController.text, category);
            //  _titleController.clear();            
            //  _contentController.clear();
             Navigator.pop(context);
           },
           child: Text("Save")),
       FlatButton(
           onPressed: () => Navigator.pop(context), child: Text("Cancel"))
        ],
      ),
    );
  }
  );
}
);

final _body = SocialFeed();

final _leadingAction = Switch(
    value: false,
    onChanged: (_) {
      AppState.setActiveView('social saved');
    });

final _meta = null;

final _section = sections.social;

 void _getPost(String title, int rating, String content, String category) {
  //  setState(() => Posts.add(Post(
  //      title: title, rating: rating, content: content, category: category)));
 }




//CATEGORY AND RATING CODE 
//========================
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: TextField(
//                    controller: _ratingController,
//                    autofocus: true,
//                    decoration: InputDecoration(
//                      labelText: "Rating",
//                    ),
//                  ),
//                )
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text("Recipe 1"),
//                Radio(
//                  value: "Recipe",
//                  groupValue: category,
//                  onChanged: (String c) => categoryOnChanged(c),
//                ),
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text("Recipe 2"),
//                Radio(
//                  value: "Recipe2",
//                  groupValue: category,
//                  onChanged: (String c) => categoryOnChanged(c),
//                )
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: TextField(
//                    controller: _contentController,
//                    autofocus: true,
//                    decoration: InputDecoration(
//                      labelText: "Post content",
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),