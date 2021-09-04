import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/UserModel.dart';

class UserController {
  UserModel userModel;
  Future<List> getUserByName(String name) async {
    var url = baseUrl + 's';

    Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List users = json;
      List<String> string = [''];
      List<UserModel> s;
      s = users.map((user) => new UserModel.fromJson(user)).toList();
      for (int i = 0; i < s.length; i++) {
        string.add(s[i].name);
      }

      return string;
    } else {
      throw Exception('Faild To get User');
    }
  }

  Future<List<UserModel>> getSignedUsers() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'showusersbysignups'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List users = json;
        return users.map((user) => UserModel.fromJson(user)).toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<String> deleteSignedUp(int id) async {
    try {
      var uri = Uri.parse(baseUrl + 'deleteusersignup/{id}');
      var response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        if (response.body == 'تم حذف بنجاح') {
          return 'تم الحذف بنجاح';
        } else {
          return 'لا يمكن حذف هذا المستخدم';
        }
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
