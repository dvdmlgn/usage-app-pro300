import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int selectedIndex = 0;
  Widget _body;
  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(Icons.calendar_view_day),
      title: Text('Inventory'),
    ),
    NavigationItem(
      icon: Icon(Icons.shopping_basket),
      title: Text('Shopping'),
    ),
    NavigationItem(
      icon: Icon(Icons.forum),
      title: Text('Social'),
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 130),
      width: isSelected ? 130 : 40,
      height: isSelected ? 44 : 20,
      padding: isSelected ? EdgeInsets.all(8.0) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.circular(24.0),
            )
          : null,

      // padding: EdgeInsets.all(10.0),

      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTheme(
                data: IconThemeData(
                  size: 28.0,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
                child: item.icon,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: isSelected
                    ? Text(
                        item.title.data,
                        style: TextStyle(color: Colors.white),
                      )
                    : Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // body:
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        title: Text(
          'uSage',
          style: TextStyle(color: Colors.teal),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.teal,
            ),
            onPressed: () => debugPrint('pressed on notifications'),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.teal,
            ),
            onPressed: () => debugPrint('pressed on search'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('pressed fab'),
        backgroundColor: Colors.teal[300],
        child: const Icon(Icons.add),
        elevation: 0.4,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 1.0,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Container(
            height: 54.0,
            padding: EdgeInsets.only(left: 6.0, right: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.map((item) {
                var _index = items.indexOf(item);

                return GestureDetector(
                  onTap: () {
                    setState( () { 
                      selectedIndex = _index; 
                      _body = items[selectedIndex].body; 
                    });
                  },
                  child: _buildItem(item, selectedIndex == _index),
                );
              }).toList(),
            ),
          )),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Widget body;
  final Widget appBar;
  final Widget fab;
  NavigationItem({this.icon, this.title, this.body, this.appBar, this.fab});
}
