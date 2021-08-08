import 'package:flutter/material.dart';
import 'package:pharma/View/Components/barGanaral.dart';

class AboutUsPage extends StatelessWidget {
  static const String id = '/AboutUsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarGeneral(title: 'حول'),
      body: Column(
        children: [
          Text('Z- pharma App'),
          Text('released by Z -tech Team'),
          Text('Damascus - syria'),
          Text('0944602916'),
        ],
      ),
    );
  }
}
