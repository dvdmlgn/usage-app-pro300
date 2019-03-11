import 'package:usage/backend/miscella.dart';

class Post {
  String id;
  String timestamp;
  String author;
  String title;
  String content;
  var tags = <String>[];
  int rating;
  String category;
  int timesPinned;
  bool saved = false;

  Post({this.author, this.title, this.content, this.tags, this.rating, this.timesPinned, this.category, this.saved}) {
    id = generateId(dataType: 'post');
    timestamp = generateTimestamp();
  }

  Post.cache({this.id, this.timestamp, this.author, this.title, this.content, this.tags, this.rating, this.timesPinned});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post.cache(
        id: json[''],
        timestamp: json['timestamp'],
        author: json['author'],
        title: json['title'],
        content: json['content'],
        tags: json['tags'],
        rating: json['rating'],
        timesPinned: json['timesPinned']
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'timestamp' : timestamp,
    'author' : author,
    'title' : title,
    'content' : content,
    'tags' : tags,
    'rating' : rating,
    'timesPinned' : timesPinned
  };

  String jsonify() => toJson().toString();


}