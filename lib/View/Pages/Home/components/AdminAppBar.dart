import 'package:flutter/material.dart';

class AdminAppBar extends StatefulWidget implements PreferredSizeWidget {
  AdminAppBar({Key key})
      : preferredSize = Size.fromHeight(60),
        super(key: key);

  @override
  _AdminAppBarState createState() => _AdminAppBarState();

  @override
  final Size preferredSize; // default is 56.0
}

class _AdminAppBarState extends State<AdminAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Z_Pharma',
        style: TextStyle(
          color: Colors.white,
          fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
        ),
      ),
    );
  }
}
