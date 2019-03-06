import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../models/view.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';
import 'viewStore.dart';
import 'dataStore.dart';

class AppState {
  static final _viewSubject = PublishSubject<View>();

  static final consumablesSubject = PublishSubject< List<Consumable> >();
  static final groceriesSubject = PublishSubject< List<Grocery> >();
  static final postsSubject = PublishSubject< List<Post> >();
  static final savedPostsSubject = PublishSubject< List<Post> >();
  static final productsSubject = PublishSubject< List<Product> >();

  /// an alias for UI/UX centric presentation code to call,
  /// this aids better abstractiom between presentation & business logic code
  /// - david (4 - march - 19)
  static Stream<View> get activeView => _viewSubject.stream;

  /// @Note: this functions assumes you have given it a valid key name,
  /// it doesn't perform any of its own validation or error handling
  /// - david (4 - march 19)
  static setActiveView(String key) {
    _viewSubject.sink.add(views[key]);
  }


  static disposeOfViewSubject() {
    _viewSubject.close();
  }

  static dispostOfConsumablesSubject() {
    consumablesSubject.close();
  }

  static disposeOfGorceriesSubject() {
    groceriesSubject.close();
  }

  static disposeOfPostsSubject() {
    postsSubject.close();
  }

  static disposeOfSavePostsSubject() {
    savedPostsSubject.close();
  }

  static disposeOfProdutsSubject() {
    productsSubject.close();
  }
  

}