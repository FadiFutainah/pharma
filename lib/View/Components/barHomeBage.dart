import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';

class BarHomePage extends StatelessWidget implements PreferredSizeWidget {
  ///const BarHomePage({ Key key }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

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
