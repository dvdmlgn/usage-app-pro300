import 'package:flutter/material.dart';
import 'package:usage/app/appRoot.dart';
import 'package:usage/app/appState.dart';
import 'package:usage/app/dataStore.dart';
import 'package:usage/components/shared/icons.dart';
import 'package:usage/components/shared/fab.dart';
import 'package:usage/components/shared/inputField.dart';
import 'package:usage/components/shopping/list/body.dart';
import 'package:usage/models/grocery.dart';
import 'package:usage/models/view.dart';
import 'package:usage/views/switch.dart';

final shoppingListView = View(
  leadingAction: _leadingAction,
  body: _body,
  section: _section,
  fab: _fab,
  meta: _meta,
);

final _formKey = GlobalKey<FormState>();
final nameCtrl = TextEditingController();
final qtyCtrl = TextEditingController();
double widgetWidth = (MediaQuery.of(AppRoot.context).size.width) * .8;
final _fab = Fab(
  icon: icons.add,
  fn: () {
    showDialog(
        context: AppRoot.context,
        builder: (context) {
          return Material(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    InputField.inputField(widgetWidth, nameCtrl, true,
                        TextInputType.text, 'Name', ''),
                    InputField.inputField(widgetWidth, qtyCtrl, true,
                        TextInputType.number, 'Quantity', ''),
                    MaterialButton(
                      minWidth: widgetWidth,
                      child: Text('ADD'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          groceriesDummy.add(Grocery(
                              name: nameCtrl.text,
                              quantity: double.parse(qtyCtrl.text)));
                          AppState.updateGroceriesSubject();
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  },
);

final _body = ShoppingListBody();

final _leadingAction = LeadingActionSwitch(
  value: false,
  fn: (value) {
    print("new value: $value");
    AppState.setActiveView('shopping basket');
  },
);

final _section = sections.shopping;

final _meta = null;
