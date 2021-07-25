import 'package:pharma/View/Pages/Admin/components/AddProductForm.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  static const String id = '/AddUserPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إضافة مستخدم',
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
      ),
      body: AddProductForm(),
    );
  }
}
