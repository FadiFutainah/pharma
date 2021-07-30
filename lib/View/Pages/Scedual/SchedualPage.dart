import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';

class SchedualPage extends StatelessWidget {
  static const String id = 'schedual';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.network(
          schedUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
