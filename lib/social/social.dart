import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/post.dart';
import '../app/logic.dart';
import '../models/post.dart';

List<Post> myPosts = posts;
Post passPost = Post();
Widget _widgetEditTitle;
Widget _widgetEditContent;
Widget _widgetEditRating;
final TextEditingController _titleController = new TextEditingController();
final TextEditingController _contentController = new TextEditingController();
final TextEditingController _ratingController = new TextEditingController();
String category;

List<Post> mySavedPosts = [];

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    var _stream;
    return StreamBuilder(
        stream: _stream,
//        initialData: view['SocialFeed'],
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
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
                                print(mySavedPosts[0].title);
                              }),
                          onTap: () {
                            passPost = myPosts[index];
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
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
          );
        });
  }

  void _getPost(String title, int rating, String content, String category) {
    setState(() => Posts.create(Post(
        title: title, rating: rating, content: content, category: category)));
  }

  void _addPost() {
    var alert = AlertDialog(
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
                    controller: _ratingController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Rating",
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Recipe 1"),
                Radio(
                  value: "Recipe",
                  groupValue: category,
                  onChanged: (String c) => categoryOnChanged(c),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Recipe 2"),
                Radio(
                  value: "Recipe2",
                  groupValue: category,
                  onChanged: (String c) => categoryOnChanged(c),
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
              _getPost(_titleController.text, int.parse(_ratingController.text),
                  _contentController.text, category);
              _titleController.clear();
              _ratingController.clear();
              _contentController.clear();
              Navigator.pop(context);
            },
            child: Text("Save")),
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  void categoryOnChanged(String c) {
    if (c == "Recipe") {
      category = "Recipe";
    } else if (c == "Recipe2") {
      category = "Recipe2";
    }
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
    return Hero(
      tag: passPost.id,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                child: _widgetEditTitle,
                onTap: () {
                  setState(() {
                    _widgetEditTitle = TextFormField(
                      textInputAction: TextInputAction.done,
                      initialValue: passPost.title,
                      onFieldSubmitted: (value) {
                        passPost.title = value;
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
                        textInputAction: TextInputAction.done,
                        initialValue: passPost.rating.toString(),
                        onFieldSubmitted: (value) {
                          passPost.rating = int.parse(value);
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
                      },
                    );
                  });
                },
              ),
              FlatButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
