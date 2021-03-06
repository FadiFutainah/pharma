import 'package:pharma/View/Pages/Admin/components/AddProductForm.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';

class AddProductPage extends StatelessWidget {
  static const String id = '/AddProductPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تعديل صنف',
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
      body: AddProductForm(),
    );
  }
}
