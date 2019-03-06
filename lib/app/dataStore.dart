import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';

final products = <Product>[];
final consumables = <Consumable>[];
final groceries = <Grocery>[];

// savedPosts are to be backuped locally & available offline
// posts are not -- they're to be pulled from the server always!
// - david (28 feb 19)
final savedPosts = <Post>[];
final posts = <Post>[];