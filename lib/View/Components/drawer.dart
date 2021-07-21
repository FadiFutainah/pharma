import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pharma/View/Pages/Bills/Bills.dart';
import 'package:pharma/View/Pages/Myinfo/MyInfo.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';

class MainpageDrawer extends StatefulWidget {
  String pageName;
  MainpageDrawer({Key key, this.pageName}) : super(key: key);

  @override
  _MainpageDrawerState createState() => _MainpageDrawerState();
}

class _MainpageDrawerState extends State<MainpageDrawer> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Ahmad',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'pharmacy',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                  size: 40,
                ),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[400],
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
                        Navigator.popAndPushNamed(context, SignIn.id);
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
                        Navigator.pushNamed(context, Bills.id);
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
                      onPressed: () {},
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
                            Icons.account_circle_outlined,
                            color: Color.fromARGB(255, 255, 142, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              'معلوماتي',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, MyInfo.id);
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
