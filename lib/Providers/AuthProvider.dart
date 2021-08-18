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
        Uri.parse(baseUrl + 'inputsignup'),
        body: {
          'name_pharmacy': user.pharmacyName,
          'name': user.name,
          'address': user.address,
          'mobile_phone': user.mobilePhone,
          'phone': user.phone,
          'password': user.password
        },
      ).timeout(Duration(seconds: 15));
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<String> logIn(String username, String password) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final response = await http.post(
        Uri.parse(baseUrl + 'login'),
        body: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        if (response.body == 'يجب عليك إنشاء حساب أولاً يا فهمان' ||
            response.body == 'كلمة السر غير صحيحة ') {
          _isAuthenticated = false;
          notifyListeners();
          return response.body;
        } else {
          // implement authorization
          storage.setString('username', username);
          storage.setString('token', json.decode(response.body)['token']);
          _isAuthenticated = true;
          notifyListeners();
          return 'تم تسجيل الدخول بنجاح';
        }
      } else {
        _isAuthenticated = false;
        notifyListeners();
        return 'response.body';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<bool> tryLogin(BuildContext context) async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      if (isAuthenticated) {
        return true;
      } else {
        logIn(storage.get('username'), storage.get('password'));
        if (isAuthenticated) {
          return true;
        } else {
          return false;
        }
      }
    } on Exception {
      return false;
    }
  }

  Future<void> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('token');
    try {
      final response = await http.post(
        Uri.parse(baseUrl + '/logout'),
        headers: {
          HttpHeaders.authorizationHeader: '$token',
        },
      );
      if (response.statusCode == 200) {
        _isAuthenticated = false;
        notifyListeners();
        return 'تم تسجيل الخروج بنجاح';
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
}
