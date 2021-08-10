import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({
    Key key,
    @required this.username,
    @required this.pharmacyName,
  }) : super(key: key);

  final String username;
  final String pharmacyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            username,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            pharmacyName,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height / 3,
    );
  }
}
