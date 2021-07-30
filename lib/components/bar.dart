import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  final String pageName;
  final bool hasShopCart;

  Bar({Key key, this.pageName, this.hasShopCart})
      : preferredSize = Size.fromHeight(60),
        super(key: key);

  @override
  _BarState createState() => _BarState();

  @override
  final Size preferredSize; // default is 56.0
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    if (widget.hasShopCart == true) {
      return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.pageName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {},
          ),
        ],
      );
    } else {
      return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.pageName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        /*leading: IconButton(
          icon: Icon(Icons.),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),*/
      );
    }
  }
}
