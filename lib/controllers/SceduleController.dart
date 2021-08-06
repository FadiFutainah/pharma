import 'dart:io';

import 'package:pharma/Common/consts.dart';
import 'package:http/http.dart' as http;

class SchedualController {
  Future<String> uploadScedual(String imagePath) async {
    var url = baseUrl + 'uploadimageschedule';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(<String, String>{
        'Authorization': 'Bearer $token',
      });
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imagePath,
        ),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        return 'uploaded';
      } else {
        return 'يوجد مشكلة في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }
}
