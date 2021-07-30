import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Bills/Bills.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Scedual/SchedualPage.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';

class MainpageDrawer extends StatefulWidget {
  final String userName;
  final String pharmacyName;
  MainpageDrawer({Key key, this.userName, this.pharmacyName}) : super(key: key);

  @override
  _MainpageDrawerState createState() => _MainpageDrawerState();
}

class _MainpageDrawerState extends State<MainpageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Text(
                  widget.userName,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.pharmacyName,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height / 3, // needs change
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
                          Icons.home,
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
                      Navigator.popAndPushNamed(context, HomePage.id);
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
                      Navigator.popAndPushNamed(context, Bills.id);
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
                      Navigator.of(context).pushNamed(SchedualPage.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
