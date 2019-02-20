import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/post.dart';
import '../app/logic.dart';
import '../models/post.dart';

List<Post> myPosts = posts;

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _contentController = new TextEditingController();
  String title;
  String content;

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
                Icons.star,
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
                      Hero(
                        tag: 'postHero',
                        child: ListTile(
                          leading: Image.network(
                            'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image',
                            width: 100,
                            height: 100,
                          ),
                          title: Text(
                            myPosts[index].title,
                            style: TextStyle(fontSize: 24.0),
                          ),
                          subtitle: Text(
                            myPosts[index].content,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                            maxLines: 10,
                          ),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.star_border,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {}),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return HeroPage();
                            }));
                          },
                        ),
                      ),
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

  void _getPost(String title, String content){
    setState(() => Posts.create(Post(title:title, content: content)));

    for(var item in myPosts){
      print(item.title);
    }
  }

  void _addPost() {
    var alert = new AlertDialog(
      content: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                controller: _titleController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: "Title",
                    hintText: "Enter a title for your post"),
              ))
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                controller: _contentController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: "Post content",
                    hintText: "What's on your mind?"),
              ))
            ],
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              _getPost(_titleController.text, _contentController.text);
              Navigator.pop(context);
            },
            child: Text("Save")),
        new FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'postHero',
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Title",
                style: TextStyle(fontSize: 30),
              ),
              Image.network(
                'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image',
                height: 300,
                width: 300,
                alignment: Alignment.center,
              ),
              Text("Content"),
            ],
          ),
        ),
      ),
    );
  }
}
