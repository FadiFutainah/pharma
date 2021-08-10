import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Routes {
  Future<void> tryLogin(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (Provider.of<AuthProvider>(context).isAuthenticated) {
      } else {
        sharedPreferences.get('token');
      }
    } catch (e) {}
  }

  static Future<void> initRole(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (Provider.of<AuthProvider>(context).isAuthenticated) {
        sharedPreferences.setString('role', 'ADMIN');
        String role = sharedPreferences.get('role');
        if (role == 'ADMIN') {
          Get.offAll(AdminHomePage());
        }
      } else {
        Get.offAll(AdminHomePage());
      }
    } on Exception {
      Get.offAll(HomePage());
    }
  }
}
