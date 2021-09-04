import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/UserSearchField.dart';
import 'package:pharma/View/Pages/Admin/AddNewAdminPage.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/AdminController.dart';
import 'package:pharma/controllers/UserControllers.dart';
import 'package:pharma/models/AdminModel.dart';
import 'package:pharma/models/UserModel.dart';

class AdminsPage extends StatefulWidget {
  static const String id = 'AdminsPage';

  final AdminController adminController = AdminController();
  @override
  _AdminsPageState createState() => _AdminsPageState();
}

class _AdminsPageState extends State<AdminsPage> {
  List<UserModel> users;
  Future<List<AdminModel>> futureAdmins;
  @override
  void initState() {
    super.initState();
    futureAdmins = widget.adminController.getAdmins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'المدراء', hasShoppingCart: false),
      body: FutureBuilder(
        future: futureAdmins,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لا يوجد اي مدير في التطبيق'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    MyButton(
                      text: 'إضافة',
                      width: MediaQuery.of(context).size.width * 0.5,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AddNewAdminPage.id);
                      },
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  title: Text(snapshot.data[index].username),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      var response = await widget
                                          .adminController
                                          .deleteAdmin(snapshot.data[index].id);
                                      if (response == 'تم الحذف بنجاح') {
                                        showSnackBar(response, context);
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                AdminHomePage.id);
                                      } else {
                                        showSnackBar(response, context);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
