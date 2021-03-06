import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';

import 'components/AddBasketForm.dart';

class AddBasketPage extends StatelessWidget {
  static const String id = '/AddBasketPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إضافة سلة',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AdminHomePage.id);
          },
        ),
      ),
      body: AddBasketForm(),
    );
  }
}
