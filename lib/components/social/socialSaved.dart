import 'package:flutter/material.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/models/post.dart';

Post passPost = Post();

Widget _widgetEditTitle;
Widget _widgetEditContent;
Widget _widgetEditRating;

class SavedPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Posts.listenToSaved,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: savedPosts.length,
              itemBuilder: (_, int index) {
                return Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.black26),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "${savedPosts[index].author ?? 'Unknown'} posted: ${savedPosts[index].title ?? 'Title'}",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.star,
                                color: Colors.black,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                          child: Hero(
                            tag: savedPosts[index].id,
                            child: Image.network(
                                'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image'),
                          ),
                          onTap: () {
                            passPost = savedPosts[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return HeroPage();
                              }),
                            );
                          }),
                      Text(
                        savedPosts[index].content + "...",
                        maxLines: 5,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              });
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
