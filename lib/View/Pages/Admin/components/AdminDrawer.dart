import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Components/DrawerComponent.dart';
import 'package:pharma/View/Components/DrawerTile.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Pages/About-us/AboutUs.dart';
import 'package:pharma/View/Pages/Admin/AdminsPage.dart';
import 'package:pharma/View/Pages/Admin/SignedUsersPage.dart';
import 'package:pharma/View/Pages/Admin/UsersPage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Home/UserHomePage.dart';
import 'package:pharma/View/Pages/Scheduale/AdminSchedualPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDrawer extends StatelessWidget {
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
                  pharmacyName: snapshot.data['pharmacyName'],
                );
              } else {
                return DrawerComponent(
                  username: 'زياد فارما',
                  pharmacyName: '',
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 24),
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
                DrawerTile(
                  icon: Icons.wysiwyg_outlined,
                  text: 'جدول التوزيع اليومي',
                  function: () {
                    Navigator.of(context).pushNamed(AdminSchedualPage.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.person,
                  text: 'المستخدمين',
                  function: () {
                    Navigator.of(context).pushNamed(SignedUsersPage.id);
                  },
                ),
                DrawerTile(
                  icon: Icons.person,
                  text: 'المستخدمين الفاعلين',
                  function: () {
                    Get.to(UsersPage());
                  },
                ),
                DrawerTile(
                  icon: Icons.admin_panel_settings_outlined,
                  text: 'المدراء',
                  function: () {
                    Navigator.of(context).pushNamed(AdminsPage.id);
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
