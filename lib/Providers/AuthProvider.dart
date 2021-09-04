import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static bool _isAuthenticated = true;
  String role = 'moder';
  String username = '';
  bool get isAuthenticated => _isAuthenticated;

  Future<void> updateCredentials() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    role ??= storage.getString('role');
    username ??= storage.getString('username');
    notifyListeners();
  }

  Future<String> signup(UserModel user) async {
    try {
      var response = await http.post(
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
      var response = await http.post(
        Uri.parse(baseUrl + 'login'),
        body: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        if (response.body == 'يجب عليك إنشاء حساب أولاً' ||
            response.body == 'كلمة السر غير صحيحة ') {
          _isAuthenticated = false;
          notifyListeners();
          return response.body;
        } else {
          await storage.setString('username', username);
          await storage.setString('token', json.decode(response.body)['token']);
          await storage.setString('role', json.decode(response.body)['role']);
          _isAuthenticated = true;
          notifyListeners();
          return 'تم تسجيل الدخول بنجاح';
        }
      } else {
        _isAuthenticated = false;
        notifyListeners();
        return 'يوجد مشكلة في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<String> tryLogin() async {
    try {
      SharedPreferences storage = await SharedPreferences.getInstance();
      if (isAuthenticated) {
        return 'moder';
        return storage.get('role');
      } else {
        logIn(storage.get('username') ?? '', storage.get('password') ?? '')
            .timeout(Duration(seconds: 45));
        if (isAuthenticated) {
          return storage.get('role');
        } else {
          return 'faild';
        }
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'faild';
    }
  }

  Future<String> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('token');
    try {
      var response = await http.post(
        Uri.parse(baseUrl + 'logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 25));
      if (response.statusCode == 200) {
        _isAuthenticated = false;
        storage.clear();
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
