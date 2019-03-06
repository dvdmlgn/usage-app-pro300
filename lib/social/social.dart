import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/post.dart';
import '../app/logic.dart';
import '../models/post.dart';

List<Post> myPosts = posts;
Post passPost = new Post();
Widget _widgetEditTitle;
Widget _widgetEditContent;
Widget _widgetEditRating;
final TextEditingController _titleController = new TextEditingController();
final TextEditingController _contentController = new TextEditingController();

List<Post> mySavedPosts;

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
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
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Hero(
                        tag: myPosts[index].id,
                        child: Image.network(
                          'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image',
                          width: 100,
                          height: 100,
                        ),
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
                        maxLines: 5,
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.star_border,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            myPosts[index].saved = true;
                            mySavedPosts.add(myPosts[index]);
                          }),
                      onTap: () {
                        passPost = myPosts[index];
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HeroPage();
                        }));
                      },
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _getPost(String title, String content) {
    setState(() => Posts.create(Post(title: title, content: content)));

    for (var item in myPosts) {
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
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    controller: _contentController,
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: "Post content",
                        hintText: "What's on your mind?"),
                  ),
                ),
              ],
            ),
          ),
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

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  initState() {
    super.initState();
    _widgetEditTitle = Text(
      passPost.title,
      style: TextStyle(fontSize: 30),
    );

    _widgetEditContent = Text(
      passPost.content,
      style: TextStyle(fontSize: 20),
    );

    _widgetEditRating = Text(
      passPost.rating.toString(),
      style: TextStyle(fontSize: 20),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: Hero(
        tag: passPost.id,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: _widgetEditTitle,
                    onTap: () {
                      setState(() {
                        _widgetEditTitle = TextFormField(
                          initialValue: passPost.title,
                          onFieldSubmitted: (value) {
                            passPost.title = value;
                            Navigator.pop(context);
                          },
                        );
                      });
                    },
                  ),
                  Center(
                    child: Image.network(
                        'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image',
                        width: 300,
                        height: 300),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: InkWell(
                      child: _widgetEditRating,
                      onTap: () {
                        setState(() {
                          _widgetEditContent = TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: passPost.rating.toString(),
                            onFieldSubmitted: (value) {
                              passPost.rating = int.parse(value);
                              Navigator.pop(context);
                            },
                          );
                        });
                      },
                    ),
                  ),
                  InkWell(
                    child: _widgetEditContent,
                    onTap: () {
                      setState(() {
                        _widgetEditContent = TextFormField(
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          maxLines: 20,
                          initialValue: passPost.content,
                          onFieldSubmitted: (value) {
                            passPost.content = value;
                            Navigator.pop(context);
                          },
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
