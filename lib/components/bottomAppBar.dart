import 'package:flutter/material.dart';
import '../app/appState.dart';
import '../app/viewStore.dart';


final bottomAppBar = BottomBar();

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     StreamBuilder(
      stream: AppState.activeView,
      // we want to move this to elsewhere in the codebase
      // once we figure out a viable means to do so.
      // - david (4 - march - 19)
      initialData: views['inventory'],
      builder: (builder, snapshot) {

        var section = snapshot.data.section;
    
        return BottomAppBar(
          elevation: 0.8,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
    
          child: Container(
            height: 54.0,
            padding: EdgeInsets.only(left: 6.0, right: 80.0),
    
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _inventory(section),
                  _shopping( section),
                  _social(   section)
                ],
              ),
          ),
        );
    
      },
    );
  }
}


_inventory(String section) => IconButton(
  icon: Icon(
    Icons.list,
    color: (section == 'inventory') ? Colors.teal : Colors.black26,
  ),
  onPressed: () => AppState.setActiveView('inventory'),
);

_shopping(String section) => IconButton(
  icon: Icon(
    Icons.shopping_basket,
    color: (section == 'shopping') ? Colors.teal : Colors.black26,
  ),
  onPressed: () => AppState.setActiveView('shopping list'),
);

_social(String section) => IconButton(
  icon: Icon(
    Icons.chat_bubble,
    color: (section == 'social') ? Colors.teal : Colors.black26,
  ),
  onPressed: () => AppState.setActiveView('social feed'),
);