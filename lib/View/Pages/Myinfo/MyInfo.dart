import 'package:flutter/material.dart';

import 'drawer.dart';

class MyInfo extends StatelessWidget {
  static const String id = 'MyInfo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffb52d),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: MainpageDrawer(
          pharmacyName: 'الصيدلية المركزية',
          userName: 'احمد',
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'My Info',
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height / 25),
        ),
        centerTitle: true,
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
                        'Ahmad',
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
