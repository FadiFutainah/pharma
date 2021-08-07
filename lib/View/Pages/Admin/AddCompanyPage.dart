import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';

import 'components/AddCompanyForm.dart';

class AddCompanyPage extends StatelessWidget {
  static const String id = '/AddCompanyPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'إضافة شركة',
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
      body: AddCompanyForm(),
    );
  }
}
