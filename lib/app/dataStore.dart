import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';
import '../models/product.dart';

final products = <Product>[];
final consumables = <Consumable>[];
final consumablesDummy = <Consumable>[
  Consumable(
      productId: '101',
      name: 'Cheese Cloth No 100',
      quantity: 8,
      expiry: '2018-04-04T12:11:24Z',
      description:
          'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id',
      imageUrl: 'http://dummyimage.com/241x196.png/ff4444/ffffff'),
  Consumable(
      productId: '102',
      name: 'Appetiser - Bought',
      quantity: 5,
      expiry: '2019-02-26T08:31:45Z',
      description:
          'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam',
      imageUrl: 'http://dummyimage.com/101x205.png/cc0000/ffffff'),
  Consumable(
      productId: '103',
      name: 'Energy Drink Bawls',
      quantity: 9,
      expiry: '2018-07-08T20:05:06Z',
      description:
          'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus',
      imageUrl: 'http://dummyimage.com/115x228.png/ff4444/ffffff'),
  Consumable(
      productId: '100',
      name: 'Island Oasis - Magarita Mix',
      quantity: 3,
      expiry: '2018-10-12T19:20:55Z',
      description:
          'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh',
      imageUrl: 'http://dummyimage.com/178x234.png/cc0000/ffffff')
];
final groceries = <Grocery>[];

// savedPosts are to be backuped locally & available offline
// posts are not -- they're to be pulled from the server always!
// - david (28 feb 19)
final savedPosts = <Post>[];
final posts = <Post>[];

var i1 = new Consumable(
    productId: '101',
    name: 'Cheese Cloth No 100',
    quantity: 8,
    expiry: '2018-04-04T12:11:24Z',
    description:
        'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id',
    imageUrl: 'http://dummyimage.com/241x196.png/ff4444/ffffff');
var i2 = new Consumable(
    productId: '102',
    name: 'Appetiser - Bought',
    quantity: 5,
    expiry: '2019-02-26T08:31:45Z',
    description:
        'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam',
    imageUrl: 'http://dummyimage.com/101x205.png/cc0000/ffffff');
var i3 = new Consumable(
    productId: '103',
    name: 'Energy Drink Bawls',
    quantity: 9,
    expiry: '2018-07-08T20:05:06Z',
    description:
        'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus',
    imageUrl: 'http://dummyimage.com/115x228.png/ff4444/ffffff');
var i4 = new Consumable(
    productId: '100',
    name: 'Island Oasis - Magarita Mix',
    quantity: 3,
    expiry: '2018-10-12T19:20:55Z',
    description:
        'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh',
    imageUrl: 'http://dummyimage.com/178x234.png/cc0000/ffffff');
var i5 = new Consumable(
    productId: '104',
    name: 'Island Oasis - Magarita Mix',
    quantity: 3,
    expiry: '2018-10-12T19:20:55Z',
    description:
        'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh',
    imageUrl: 'http://dummyimage.com/178x234.png/cc0000/ffffff');
var i6 = new Consumable(
    productId: '105',
    name: 'Oil - Cooking Spray',
    quantity: 9,
    expiry: '2018-03-31T00:39:57Z',
    description:
        'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',
    imageUrl: 'http://dummyimage.com/122x244.png/cc0000/ffffff');

void fillList() {
  consumables.add(i1);
  consumables.add(i2);
  consumables.add(i3);
  consumables.add(i4);
  consumables.add(i5);
  consumables.add(i6);
}
