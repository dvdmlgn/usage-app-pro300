import 'package:flutter/material.dart';

// import 'package:path/path.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/models/post.dart';

List<Post> myPosts = dummyPosts;
Post passPost = Post();
Widget _widgetEditTitle;
Widget _widgetEditContent;
Widget _widgetEditRating;
//final TextEditingController _titleController = new TextEditingController();
//final TextEditingController _contentController = new TextEditingController();
//final TextEditingController _ratingController = new TextEditingController();
//String category;

List<Post> mySavedPosts = [];

class SocialFeed extends StatefulWidget {
  const SocialFeed({
    Key key,
  }) : super(key: key);

  @override
  @override
  _SocialFeedState createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed> {
  @override
  Widget build(BuildContext context) {
    var _stream;
    return StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: myPosts.length,
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
                            myPosts[index].author +
                                " posted: " +
                                myPosts[index].title,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            onPressed: null,
                            iconSize: 35.0,
                            padding: EdgeInsets.only(left: 70.0),
                          ),
                        ],
                      ),
                      InkWell(
                          child: Hero(
                            tag: myPosts[index].id,
                            child: Image.network(
                                'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image'),
                          ),
                          onTap: () {
                            passPost = myPosts[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return HeroPage();
                              }),
                            );
                          }),
                      Text(
                        myPosts[index].content + "...",
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
