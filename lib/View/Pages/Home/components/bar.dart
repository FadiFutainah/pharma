import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';
import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  Bar({Key key})
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
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'زياد فارما',
        style: TextStyle(
          color: Colors.white,
          fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(Icons.more_vert),
      //   onPressed: () => Scaffold.of(context).openDrawer(),
      // ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
          //open the current bill----------------------------------//
          onPressed: () {
            Navigator.of(context).pushNamed(ShoppingCart.id);
          },
        ),
      ],
    );
  }
}
