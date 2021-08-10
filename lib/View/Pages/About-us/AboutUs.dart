import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  static const String id = '/AboutUsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'حول',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Z_Pharma App ' +
                '\n'
                    ' released By Z-tech Team' +
                '\n'
                    'Damascus - Syria' +
                '\n'
                    '0944602916',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
