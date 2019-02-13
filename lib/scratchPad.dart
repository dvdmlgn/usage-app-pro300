import 'package:flutter/material.dart';
import 'backend/miscella.dart';
import 'backend/transactionLog.dart';
import 'models/consumable.dart';
import 'app/logic.dart';
import 'app/dataStore.dart';
import './inventory/inventory_page.dart';
import './inventory/gallery.dart';
import './backend/auth.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // String plainText     = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ........';
  String plainText =
      'why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,.. why hello there,..';
  String encryptedText = '';
  String decryptedText = '';

  Consumable consumable =
      Consumable(name: 'cherry', productId: 'vvv32', quantity: 5.0);

  // var conList = <Consumable>[
  //   Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 ),
  //   // Consumable( name: 'cherry', productId: 'vvv32', quantity: 5.0 )
  // ];

  String conListString = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    biometricInit();

    for (var item in transactionLog) {
      debugPrint("transaction:");
      debugPrint(item.jsonify());
    }

    debugPrint(transactionLog.length.toString());

    // Products.create();

    conListString += "[";

    // Consumables.consumed(consumable);

    // for (var consumable in conList) {
    //   conListString += consumable.jsonify();
    // }

    Consumables.create(
        Consumable(productId: 'vv23', name: 'cherry', quantity: 4.0));

    for (var item in consumables) {
      debugPrint("consumable");
      debugPrint(item.jsonify());
    }

    for (var item in transactionLog) {
      debugPrint("transaction:");
      debugPrint(item.jsonify());
    }

    debugPrint(transactionLog.length.toString());

    conListString += ']';

    encryptedText = encrypt(conListString);
    decryptedText = decrypt(encryptedText);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => biometricTest(),
            child: Text('test biometrics'),
          ),
        )
        // Center(
        //   // Center is a layout widget. It takes a single child and positions it
        //   // in the middle of the parent.
        //   child: Column(
        //     // Column is also layout widget. It takes a list of children and
        //     // arranges them vertically. By default, it sizes itself to fit its
        //     // children horizontally, and tries to be as tall as its parent.
        //     //
        //     // Invoke "debug painting" (press "p" in the console, choose the
        //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //     // to see the wireframe for each widget.
        //     //
        //     // Column has various properties to control how it sizes itself and
        //     // how it positions its children. Here we use mainAxisAlignment to
        //     // center the children vertically; the main axis here is the vertical
        //     // axis because Columns are vertical (the cross axis would be
        //     // horizontal).
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text( conListString ),
        //       Text( encryptedText ),
        //       Text( decryptedText ),

        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
