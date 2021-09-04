import 'package:flutter/material.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Home/UserHomePage.dart';

class RoutingPage extends StatelessWidget {
  static const String id = 'RoutingPage';
  final AuthProvider authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: authProvider.tryLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case 'moder':
                return AdminHomePage();
                break;
              case 'user':
                return UserHomePage();
                break;
              default:
                return HomePage();
            }
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xffffb52d),
              strokeWidth: 5,
            ),
          );
        },
      ),
    );
  }
}
