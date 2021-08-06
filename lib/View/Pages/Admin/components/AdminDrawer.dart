import 'package:flutter/material.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Pages/Admin/AddUserPage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Schedual/AdminSchedualPage.dart';
import 'package:provider/provider.dart';

class AdminDrawer extends StatefulWidget {
  final String userName;
  final String pharmacyName;
  AdminDrawer({Key key, this.userName, this.pharmacyName}) : super(key: key);

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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
                      Navigator.of(context).pop();
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
                          Icons.logout,
                          color: Color.fromARGB(255, 255, 142, 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'تأكيد تسجيل الخروج',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Center(
                              child: MyButton(
                                text: 'موافق',
                                width: MediaQuery.of(context).size.width * 0.35,
                                onPressed: () {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .logout();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      HomePage.id, (route) => false);
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                          ],
                        ),
                      );
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
                      Navigator.of(context)
                          .popAndPushNamed(AdminSchedualPage.id);
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
                          Icons.person,
                          color: Color.fromARGB(255, 255, 142, 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          child: Text(
                            'المستخدمين',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AddUserPage.id);
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
