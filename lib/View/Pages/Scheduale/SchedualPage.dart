import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';

class SchedualPage extends StatelessWidget {
  static const String id = 'scheduale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'جدول التوزيع اليومي    ',
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Image.network(
          schedUrl,
          fit: BoxFit.contain,
          frameBuilder: (BuildContext context, Widget child, int frame,
              bool wasSynchronouslyLoaded) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: child,
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 100,
                color: Colors.grey,
              ),
            );
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
