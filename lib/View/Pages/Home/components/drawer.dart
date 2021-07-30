import 'package:pharma/View/Pages/Bills/Bills.dart';
import 'package:pharma/View/Pages/Myinfo/MyInfo.dart';
import 'package:pharma/View/Pages/Scedual/SchedualPage.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';
import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  final String userName;
  final String pharmacyName;

  HomePageDrawer({this.userName, this.pharmacyName});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pharmacyName,
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
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
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
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.fact_check_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'الفواتير',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
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
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.wysiwyg_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'جدول التوزيع اليومي',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
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
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 60),
                  child: TextButton(
                    style: ButtonStyle(),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'معلوماتي',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
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
    );
  }
}
