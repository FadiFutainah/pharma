import 'package:flutter/material.dart';

String editableUrl = '192.168.1.4';
String baseUrl = 'http://' + editableUrl + ':8000/api/';
// String baseUrl = 'https://ossamaapplication.herokuapp.com/api/';
String token = '15|28ezAlxMVAaJPhS8dqHZhBXFCpuVB0wUjLQlDynf';
String imgUrl = 'http://' + editableUrl + ':8000/upload/image_company/';
String schedUrl =
    'http://' + editableUrl + ':8000/upload/schedule/scheduale.jpg';

void showSnackBar(String text, BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 700),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
