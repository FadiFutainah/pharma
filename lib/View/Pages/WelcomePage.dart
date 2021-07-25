import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';

class WelcomePage extends StatelessWidget {
  static const String id = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, HomePage.id);
          },
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
            'سيتم التواصل معكم لتأكد المعلومات ونرحب باقتراحاتكم نأمل أن نقدم لكم الفائدة دائماً',
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
