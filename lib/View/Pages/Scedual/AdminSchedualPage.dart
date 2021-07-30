import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';

class AdminSchedualPage extends StatelessWidget {
  static const String id = 'Adminschedual';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(
          schedUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
