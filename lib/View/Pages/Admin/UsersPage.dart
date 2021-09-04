import 'package:flutter/material.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Components/UserSearchField.dart';
import 'package:pharma/controllers/AdminController.dart';
import 'package:pharma/controllers/UserControllers.dart';
import 'package:pharma/models/UserModel.dart';

class UsersPage extends StatefulWidget {
  static const String id = 'AddUsersPage';

  final UserController userController = UserController();
  final AdminController adminController = AdminController();
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel> users;
  Future<List<UserModel>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = widget.adminController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GeneralAppBar(title: ' المستخدمين الفعالين', hasShoppingCart: false),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Center(
                  child: Text('لا يوجد اي مستخدم غير مسجل دخول'),
                );
              }
              return Column(
                children: [
                  UserSearchField(users: snapshot.data),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
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
                                    title: Text(snapshot.data[index].name),
                                    subtitle:
                                        Text(snapshot.data[index].pharmacyName),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.45,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'معلومات المستخدم',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.08,
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.3,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: GridView(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisExtent: 35,
                                                      ),
                                                      children: [
                                                        Text('رقم الهاتف'),
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                          child: Center(
                                                            child: Text(snapshot
                                                                .data[index]
                                                                .phone
                                                                .toString()),
                                                          ),
                                                        ),
                                                        Text('رقم الجوال'),
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Center(
                                                            child: Text(snapshot
                                                                .data[index]
                                                                .mobilePhone
                                                                .toString()),
                                                          ),
                                                        ),
                                                        Text('العنوان'),
                                                        SingleChildScrollView(
                                                          child: Center(
                                                            child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .address
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                            ),
                                                          ),
                                                        ),
                                                        Text('كلمة السر'),
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                          child: Center(
                                                            child: Text(snapshot
                                                                .data[index]
                                                                .password),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
              return Center(child: Text('لا يوجد اتصال بالانترنت'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
