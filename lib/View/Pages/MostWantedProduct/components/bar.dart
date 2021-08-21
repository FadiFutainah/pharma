import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  final String barTitle;

  Bar({Key key, this.barTitle})
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
      backgroundColor: Color(0xffffb52d),
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.barTitle,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(ShoppingCart.id);
          },
        ),
      ],
    );
  }
}
