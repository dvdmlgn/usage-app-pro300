import '../models/product.dart';
import '../models/consumable.dart';
import '../models/grocery.dart';

import './dataStore.dart';
import '../backend/transactionLog.dart';


class Consumables {
  
  static create(Consumable item) {
    consumables.add(item);

    Transaction(
      action: 'create',
      dataType: 'consumable',
      oldState: 'nil',
      newState: item.jsonify()
    );
    
  }

  static edit() {

  }

  static delete() {

  }


}


class Products {

  static create() {

  }

  static edit() {

  }

  static delete() {

  }

}


class Groceries {

  static create() {
    
  }

  static edit() {

  }

  static delete() {

  }


}