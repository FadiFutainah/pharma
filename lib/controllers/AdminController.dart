import 'dart:io';
import 'dart:convert' as convert;

import 'package:pharma/Common/consts.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/models/AdminModel.dart';
import 'package:pharma/models/UserModel.dart';

class AdminController {
  Future<String> deleteAdmin(int id) async {
    try {
      var uri = Uri.parse(baseUrl + 'deleteonlyadmin/$id');
      var response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      print(response.statusCode);
      print(response.body);
      print(id);

      if (response.statusCode == 200) {
        var res = convert.jsonDecode(response.body);
        print(res);
        if (res == 'تم الحذف بنجاح') {
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

  Future<List<UserModel>> getUsers() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + 'showusers'),
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

  Future<List<String>> getUsersName(List<UserModel> users) async {
    List<String> res = [];
    for (var user in users) {
      res.add(user.name);
    }
    return res;
  }

  Future<String> addAdmin(String username, String password) async {
    var url = baseUrl + 'addnewadmin';
    Map<String, dynamic> json = {'username': username, 'psawword': password};
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: json,
      );
      if (response.statusCode == 200) {
        if (response.body == '"success"') {
          return 'تم إضافة المدير بنجاح';
        } else {
          return 'يوجد مشكلة في الشبكة';
        }
      } else if (response.statusCode == 401) {
        return 'يرجى تسجيل الدخول أولاً';
      } else {
        return 'يوجد مشكلة في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<String> approveUser(int id) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'aproveuser/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return 'تمت الموافقة على هذا المستخدم';
      } else {
        return 'يوجد مشكلة في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<List<AdminModel>> getAdmins() async {
    var url = baseUrl + 'show_admins';
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List admins = convert.jsonDecode(response.body);
        return admins.map((admin) => AdminModel.fromMap(admin)).toList();
      } else {
        return null;
      }
    } on SocketException {
      return null;
    } on Exception {
      return null;
    }
  }
}
