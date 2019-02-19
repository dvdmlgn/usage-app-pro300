import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/post.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  List<Post> myPosts = posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
            tooltip: "Add Item",
            backgroundColor: Colors.blue,
            child: new ListTile(
              title: Icon(Icons.add),
            ),
            onPressed: _addPost),
        appBar: AppBar(
          title: Text("Social"),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: false,
                itemCount: myPosts.length,
                itemBuilder: (_, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            myPosts[index].title,
                            style: TextStyle(fontSize: 24.0),
                          ),
                          subtitle: Text(
                                myPosts[index].content,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 10,
                              ),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
    );
  }

  Post _addPost() {
    Post newPost;
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("New Post"),
            content: Column(
              children: <Widget>[
                Text("Title"),
                TextField(),
                Text("Content"),
                TextField()
              ],
            )));
    return newPost;
  }
}
