import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';
import '../models/post.dart';

// {id:2,},
// {id:3,},
// {id:5,productID:105,name:Oil - Cooking Spray,quantity:9,expiry:2018-03-31T00:39:57Z,description:amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere,image:http://dummyimage.com/122x244.png/cc0000/ffffff},
// {id:6,productID:106,name:Foam Dinner Plate,quantity:2,expiry:2019-03-10T23:05:38Z,description:integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non,image:http://dummyimage.com/145x163.png/5fa2dd/ffffff},
// {id:7,productID:107,name:Coffee - Beans, Whole,quantity:4,expiry:2018-09-04T09:48:44Z,description:massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu,image:http://dummyimage.com/233x197.png/cc0000/ffffff},
// {id:8,productID:108,name:Wine - Toasted Head,quantity:6,expiry:2018-11-25T06:36:12Z,description:lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius,image:http://dummyimage.com/199x121.png/dddddd/000000},
// {id:9,productID:109,name:Cardamon Ground,quantity:4,expiry:2018-07-25T15:15:00Z,description:in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere,image:http://dummyimage.com/228x240.png/dddddd/000000},
// {id:10,productID:110,name:Turkey - Breast, Boneless Sk On,quantity:2,expiry:2018-08-17T14:55:12Z,description:lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam,image:http://dummyimage.com/125x129.png/dddddd/000000},
// {id:11,productID:111,name:Beef - Striploin Aa,quantity:2,expiry:2019-01-14T23:22:16Z,description:ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien,image:http://dummyimage.com/226x227.png/5fa2dd/ffffff},
// {id:12,productID:112,name:Squash - Butternut,quantity:9,expiry:2018-05-07T15:20:51Z,description:erat nulla tempus vivamus in felis eu sapien cursus vestibulum,image:http://dummyimage.com/110x158.png/dddddd/000000},
// {id:13,productID:113,name:Puree - Kiwi,quantity:2,expiry:2018-04-19T05:18:18Z,description:blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede,image:http://dummyimage.com/109x200.png/dddddd/000000},
// {id:14,productID:114,name:Wine - Red, Metus Rose,quantity:2,expiry:2018-06-23T11:34:57Z,description:pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices,image:http://dummyimage.com/178x212.png/5fa2dd/ffffff},
// {id:15,productID:115,name:Noodles - Cellophane, Thin,quantity:8,expiry:2018-05-11T16:13:21Z,description:fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend,image:http://dummyimage.com/240x223.png/ff4444/ffffff},
// {id:16,productID:116,name:Mackerel Whole Fresh,quantity:4,expiry:2018-10-09T07:08:45Z,description:cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet,image:http://dummyimage.com/233x243.png/ff4444/ffffff},
// {id:17,productID:117,name:Bananas,quantity:7,expiry:2018-05-30T16:22:05Z,description:donec dapibus duis at velit eu est congue elementum in,image:http://dummyimage.com/219x162.png/ff4444/ffffff},
// {id:18,productID:118,name:Goulash Seasoning,quantity:6,expiry:2018-10-20T04:05:34Z,description:magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent,image:http://dummyimage.com/123x187.png/ff4444/ffffff},
// {id:19,productID:119,name:Kolrabi,quantity:1,expiry:2019-01-30T16:57:07Z,description:accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi,image:http://dummyimage.com/110x109.png/ff4444/ffffff},
// {id:20,productID:120,name:Cherries - Fresh,quantity:8,expiry:2018-12-31T02:01:25Z,description:blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer,image:http://dummyimage.com/198x243.png/ff4444/ffffff}];

var products = <Product>[];
var consumables = <Consumable>[];
var groceries = <Grocery>[];
// var basket = <Grocery>[];

var posts = fillPosts();

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

var s1 = new Grocery(name: 'Potato', quantity: 20);
var s2 = new Grocery(name: 'Peas', quantity: 1);
var s3 = new Grocery(name: 'Beans', quantity: 6);
var s4 = new Grocery(name: 'Peaches', quantity: 4);
var s5 = new Grocery(name: 'Hazelnuts', quantity: 1);
var s6 = new Grocery(name: 'Bread', quantity: 1);

var p1 = new Post(
    author: "Paul",
    title: "This is a title",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec tellus ac nibh commodo consequat vitae sollicitudin dolor. Mauris commodo felis et neque finibus, ac sagittis nulla cursus. Duis pharetra pulvinar diam ac tempor. Curabitur nec elit lectus. Aenean aliquam tincidunt turpis, eu lacinia eros maximus at. Morbi libero elit.",
    tags: ["Tag", "Tag", "Tag"],
    rating: 4,
    timesPinned: 27);

void fillList() {
  consumables.add(i1);
  consumables.add(i2);
  consumables.add(i3);
  consumables.add(i4);
  consumables.add(i5);
  consumables.add(i6);
}

void fillSList() {
  // List<Grocery> allGroceries;
  // allGroceries.add(s1);
  // allGroceries.add(s2);
  // allGroceries.add(s3);
  // allGroceries.add(s4);
  // allGroceries.add(s5);
  // allGroceries.add(s6);
  // for (var item in allGroceries) {
  //   print(item.toJson());
  // }
  // print('before');
  // s1.inBasket = true;
  // s2.inBasket = true;
  // s3.inBasket = true;
  // print('after');
  // for (var item in allGroceries) {
  //   print(item.toJson());
  // }
  // for (var g in allGroceries) {
  //   if (g.inBasket == false) {
  //     groceries.add(g);
  //   } else {
  //     basket.add(g);
  //   }
  // }
  s1.inBasket = true;
  s2.inBasket = true;
  s3.inBasket = true;

  groceries.add(s1);
  groceries.add(s2);
  groceries.add(s3);
  groceries.add(s4);
  groceries.add(s5);
  groceries.add(s6);
  // s1.inBasket = true;
  // s2.inBasket = true;
  // s3.inBasket = true;

  for (var item in groceries) {
    print(item.id);
  }
}

List<Post> fillPosts() {
  List<Post> samplePosts = new List<Post>();

  samplePosts.add(p1);

  return samplePosts;
}
