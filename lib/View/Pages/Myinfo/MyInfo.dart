import 'package:flutter/material.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Components/drawerGeneral.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfo extends StatefulWidget {
  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  Future<Map<String, String>> getCredentials() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return {
      'username': storage.getString('username') ?? '',
      'pharmacyName': storage.getString('pharmacyName') ?? 'زياد فارما'
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffb52d),
      drawer: DrawerGeneral(),
      appBar: GeneralAppBar(
        hasShoppingCart: false,
        title: 'معلوماتي',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 35),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width / 80,
                      indent: MediaQuery.of(context).size.width / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 35),
                      child: Text(
                        'الصيدلية المركزية',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width / 80,
                      indent: MediaQuery.of(context).size.width / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 35),
                      child: Text(
                        'ساحة السبع بحرات مقابل البنك المركزي',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width / 80,
                      indent: MediaQuery.of(context).size.width / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 35),
                      child: Text(
                        '0987654321',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width / 80,
                      indent: MediaQuery.of(context).size.width / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 35),
                      child: Text(
                        '0111234567',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 35,
                          //color: Colors.white
                        ),
                      ),
                    ),
                    Divider(
                      endIndent: MediaQuery.of(context).size.width / 80,
                      indent: MediaQuery.of(context).size.width / 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'تسجيل خروج',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 35,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
