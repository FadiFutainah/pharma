import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    Key key,
    @required this.function,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final VoidCallback function;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        child: Card(
          child: OutlinedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(2)),
            onPressed: function,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: MediaQuery.of(context).size.height / 25,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 18,
                    ),
                    Icon(
                      icon,
                      size: MediaQuery.of(context).size.height / 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
      ),
    );
  }
}
