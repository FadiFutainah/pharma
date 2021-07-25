import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  Bar({Key key})
      : preferredSize = Size.fromHeight(60),
        super(key: key);

  @override
  _BarState createState() => _BarState();

  @override
  // TODO: implement preferredSize
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
        'تسجيل الدخول ',
        style: TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
