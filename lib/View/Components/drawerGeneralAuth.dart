import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Pages/About-us/AboutUs.dart';
import 'package:pharma/View/Pages/Bills/Bills.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Scheduale/SchedualPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DrawerComponent.dart';
import 'DrawerTile.dart';
import 'MyButton.dart';

class DrawerGeneralAuth extends StatelessWidget {
  Future<Map<String, String>> getCredentials() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return {
      'username': storage.getString('username') ?? '',
      'pharmacyName': storage.getString('pharmacyName') ?? 'زياد فارما'
    };
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          FutureBuilder(
            future: getCredentials(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return DrawerComponent(
                    username: snapshot.data['username'],
                    pharmacyName: snapshot.data['pharmacyName']);
              } else {
                return DrawerComponent(
                    username: 'زياد فارما', pharmacyName: '');
              }
            },
          ),
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
                  icon: Icons.fact_check_outlined,
                  text: 'الفواتير',
                  function: () {
                    Navigator.popAndPushNamed(context, Bills.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.wysiwyg_outlined,
                  text: 'جدول التوزيع اليومي',
                  function: () {
                    Navigator.of(context).pushNamed(SchedualPage.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.info_outline,
                  text: 'حول',
                  function: () {
                    Navigator.of(context).pushNamed(AboutUsPage.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.logout,
                  text: 'تسجيل الخروج',
                  function: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'تأكيد تسجيل الخروج',
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Center(
                            child: MyButton(
                              text: 'موافق',
                              width: MediaQuery.of(context).size.width * 0.35,
                              onPressed: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .logout();
                                Get.offAll(HomePage());
                              },
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01)
                        ],
                      ),
                    );
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
