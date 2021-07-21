import 'dart:async';

import 'package:pharma/Controllers/UserControllers.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MainpageDrawer extends StatefulWidget {
  String userName;
  String pharmacyName;
  MainpageDrawer({Key key, this.userName, this.pharmacyName}) : super(key: key);

  @override
  _MainpageDrawerState createState() => _MainpageDrawerState();
}

class _MainpageDrawerState extends State<MainpageDrawer> {
  UserController userController = new UserController();

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.userName),
              accountEmail: Text(widget.pharmacyName),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                  size: 40,
                ),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
              child: Column(
                ///mainAxisSize: MainAxisSize.min,
                ///mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 60),
                    child: TextButton(
                      style: ButtonStyle(),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.login,
                            color: Color.fromARGB(255, 255, 142, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'الصفحة الرئيسية',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          showSpinner = true;
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              showSpinner = false;
                              Navigator.popAndPushNamed(context, HomePage.id);
                            });
                          });
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 60),
                    child: TextButton(
                      style: ButtonStyle(),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.login,
                            color: Color.fromARGB(255, 255, 142, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          showSpinner = true;
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              showSpinner = false;
                              Navigator.popAndPushNamed(context, SignIn.id);
                            });
                          });
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 60),
                    child: TextButton(
                      style: ButtonStyle(),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.fact_check_outlined,
                            color: Color.fromARGB(255, 255, 142, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'الفواتير',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          showSpinner = true;
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              showSpinner = false;
                              Navigator.popAndPushNamed(context, SignIn.id);
                            });
                          });
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 60),
                    child: TextButton(
                      style: ButtonStyle(),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.wysiwyg_outlined,
                            color: Color.fromARGB(255, 255, 142, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'جدول التوزيع اليومي',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          showSpinner = true;
                          Timer(Duration(milliseconds: 500), () {
                            setState(() {
                              showSpinner = false;
                              Navigator.popAndPushNamed(context, SignIn.id);
                            });
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
