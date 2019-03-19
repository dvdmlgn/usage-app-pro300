import 'package:flutter_test/flutter_test.dart';
import 'package:usage/models/post.dart';
import 'package:usage/app/logic.dart';
import 'package:usage/app/dataStore.dart';

void main() {

  group('Posts functionality: ', () {

    test('posts successfully added to Posts list', () {
      var _post = Post(
        author: 'author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      Posts.add(_post);

      expect(posts.last.id, _post.id);
    });

    test('successfully edited an existing post in Posts list', () {
      var _post = Post(
        author: 'author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      var _editedPost = Post(
        author: 'new author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      Posts.add(_post);
      var _index = posts.indexWhere((e) => e.id == _post.id);
      Posts.edit(_index, _editedPost);

      expect(posts[_index].id, _post.id);
      expect(posts[_index].author, _editedPost.author);
    });

    test('successfully deleted an existing post from the Posts list', () {
      var _post = Post(
        author: 'author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      Posts.add(_post);
      var _index = posts.indexWhere((e) => e.id == _post.id);
      Posts.delete(_index);
      var _indexOfDeleted = posts.indexWhere((e) => e.id == _post.id);

      expect(_indexOfDeleted, -1);
    });

    test('successfully added a post to the savedPosts list', () {
      var _post = Post(
        author: 'author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      Posts.add(_post);
      var _index = posts.indexWhere((e) => e.id == _post.id);
      Posts.addToSaved(_index);
      var _savedIndex = savedPosts.indexWhere((e) => e.id == _post.id);

      expect(_savedIndex, isNot(-1));
    });

    test('successfully removed a post from the savedPosts list', () {
      var _post = Post(
        author: 'author of test',
        title: 'title of post',
        content: 'the content which inhabits this post',
        tags: [
          'test',
          'miscella',
          'another one'
        ],
        rating: 8,
        timesPinned: 6
      );

      Posts.add(_post);
      var _index = posts.indexWhere((e) => e.id == _post.id);
      Posts.addToSaved(_index);
      var _savedIndex = savedPosts.indexWhere((e) => e.id == _post.id);
      
      Posts.removeFromSaved(_savedIndex);
      var _checkIndex = savedPosts.indexWhere((e) => e.id == _post.id);

      expect(_checkIndex, -1);
    });


  });

}