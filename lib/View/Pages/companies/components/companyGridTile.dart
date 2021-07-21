import 'package:flutter/material.dart';

class CompanyGridTile extends StatefulWidget {
  Image image;
  String companyName;

  ///CompanyGridTile({Key key, /*this.image, this.companyName*/}) : super(key: key);

  @override
  _CompanyGridTileState createState() => _CompanyGridTileState();
}

class _CompanyGridTileState extends State<CompanyGridTile> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('العرض الجديد'),
          children: [
            Container(
              child: Center(child: Text('العرض')),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _showDialog(context);
            });
          },
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('images/pharmacy-symbol-medical-snake-vector-3525841.jpg',
                                  height:MediaQuery.of(context).size.height/7.4),
            ),
          ),
        ),
        Text('mmzz'),
      ],
    )
  );
  }
}
