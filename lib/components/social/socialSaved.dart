import 'package:flutter/material.dart';

class SavedPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _stream;
    return StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.network(
                    'https://imgplaceholder.com/420x320/ff7f7f/333333/fa-image',
                    width: 100,
                    height: 100,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  subtitle: Text(
                    "Content",
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    maxLines: 5,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
