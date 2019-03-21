import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';

final products = <Product>[];
final consumables = <Consumable>[];
final expiringItems = <Consumable>[];
final consumablesDummy = <Consumable>[
  Consumable(
      productId: '101',
      name: 'Apple',
      quantity: 8,
      expiry: '2019-03-21',
      description:
          'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id',
      imageUrl:
          'https://image.shutterstock.com/image-photo/red-ripe-apple-450w-119879914.jpg'),
  Consumable(
      productId: '102',
      name: 'Banana',
      quantity: 5,
      expiry: '2019-03-28',
      description:
          'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam',
      imageUrl:
          'https://as2.ftcdn.net/jpg/00/81/63/27/500_F_81632784_dywiaX7xqRp7KDqMluwgqlkykvz3aK03.jpg'),
  Consumable(
      productId: '103',
      name: 'Carrot',
      quantity: 9,
      expiry: '2019-03-12',
      description:
          'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus',
      imageUrl:
          'https://image.shutterstock.com/image-photo/fresh-young-carrot-on-table-450w-459404320.jpg'),
  Consumable(
      productId: '100',
      name: 'Potato',
      quantity: 3,
      expiry: '2019-03-18',
      description:
          'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh',
      imageUrl:
          'https://as2.ftcdn.net/jpg/01/09/60/37/500_F_109603745_Dvrk4jcCYvvT0cHJDg6QkPErGvKkqRKt.jpg'),
];
final groceries = <Grocery>[];
final groceriesDummy = <Grocery>[
  Grocery(name: 'Potato', quantity: 20),
  Grocery(name: 'Peas', quantity: 1),
  Grocery(name: 'Beans', quantity: 6),
  Grocery(name: 'Peaches', quantity: 4),
  Grocery(name: 'Hazelnuts', quantity: 1),
  Grocery(name: 'Bread', quantity: 1),
];

// savedPosts are to be backuped locally & available offline
// posts are not -- they're to be pulled from the server always!
// - david (28 feb 19)
final savedPosts = <Post>[];

final posts = <Post>[
  Post(
    author: "Paul",
    title: "Mushroom Pie",
    content:
    "This is just what you need on a cold night. Serve with creamy mashed potatoes",
  ),
  Post(
    author: "Elise",
    title: "Banana Bread",
    content:
    "I was given this banana bread recipe years ago from my friend Heidi H, who, many years before, had begged the recipe from a ski buddy’s mother—Mrs. Hockmeyer. Thanks Heidi!",
  ),
];
