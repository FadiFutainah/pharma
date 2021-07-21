import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<String> signup(UserModel user) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(baseUrl + '/inputsignup'),
        body: {
          'name_pharmacy': user.pharmacyName,
          'name': user.name,
          'address': user.address,
          'mobile_phone': user.mobilePhone,
          'phone': user.phone,
          'password': user.password
        },
      ).timeout(Duration(seconds: 15));
      if (response.statusCode == 200) {
        return 'تم التسجيل بنجاح';
      } else {
        return 'خطأ في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on TimeoutException {
      return 'اتصال ضعيف بالشبكة';
    } on Exception {
      return 'لا يوجد اتصال بالشبكة';
    }
  }

  Future<http.Response> logIn(String username, String password) async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    final response = await http.post(
      Uri.parse(baseUrl + '/login'),
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      if (response.body == 'wrong password' ||
          response.body == 'wrong username') {
        _isAuthenticated = false;
        notifyListeners();
        return response;
      } else {
        storage.setString('username', username);
        storage.setString('token', json.decode(response.body)['token']);
        _isAuthenticated = true;
        notifyListeners();
        return response;
      }
    } else {
      _isAuthenticated = false;
      notifyListeners();
      return response;
    }
  }

  // Future<void> logout(String username, String password) async {
  //   String token = await storage.getToken();

  //   final response = await http.post(Uri.parse(baseUrl + '/logout'), headers: {
  //     HttpHeaders.authorizationHeader: '$token',
  //   }, body: {
  //     'username': username,
  //     'password': password,
  //   });

  //   _isAuthenticated = false;
  //   storage.deleteToken();
  //   notifyListeners();
  // }
}
