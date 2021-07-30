import 'package:flutter/material.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _BarState createState() => _BarState();

  @override
  Size get preferredSize => Size.fromHeight(56);
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
        'الشركات',
        style: TextStyle(color: Colors.white),
      ),

      /*actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {},
          ),
        ],*/
    );
  }
}
