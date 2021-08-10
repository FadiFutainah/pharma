import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/About-us/AboutUs.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';

import 'DrawerComponent.dart';
import 'DrawerTile.dart';

class DrawerGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerComponent(username: 'زياد فارما', pharmacyName: ''),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DrawerTile(
                  icon: Icons.home,
                  text: 'الصفحة الرئيسية',
                  function: () {
                    Navigator.of(context).pop();
                  },
                ),
                DrawerTile(
                  icon: Icons.login,
                  text: 'تسجيل الدخول',
                  function: () {
                    Navigator.popAndPushNamed(context, SignIn.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.info_outline,
                  text: 'حول',
                  function: () {
                    Navigator.of(context).pushNamed(AboutUsPage.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
