import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.function,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
      child: TextButton(
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color.fromARGB(255, 255, 142, 1),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Text(
                  text,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
        onPressed: function,
      ),
    );
  }
}
