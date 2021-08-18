import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/barGanaral.dart';
import 'package:pharma/controllers/UserControllers.dart';
import 'package:pharma/models/UserModel.dart';

class SignedUsersPage extends StatefulWidget {
  static const String id = 'AddUsersPage';

  final UserController userController = UserController();

  @override
  _SignedUsersPageState createState() => _SignedUsersPageState();
}

class _SignedUsersPageState extends State<SignedUsersPage> {
  List<UserModel> users;
  Future<List<UserModel>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = widget.userController.getSignedUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarGeneral(title: 'المستخدمين'),
      body: FutureBuilder(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('لا يوجد اي مستخدم غير مسجل دخول'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].pharmacyName),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          widget.userController
                              .deleteSignedUp(snapshot.data[index].id);
                        },
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.4,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: GridView(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 35),
                                        children: [
                                          Text('رقم الهاتف'),
                                          Text(snapshot.data[index].phone
                                              .toString()),
                                          Text('رقم الجوال'),
                                          Text(snapshot.data[index].mobilePhone
                                              .toString()),
                                          Text('العنوان'),
                                          Text(snapshot.data[index].address
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MyButton(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    text: 'الموافقة',
                                    onPressed: () async {
                                      String response = await widget
                                          .userController
                                          .approveUser(snapshot.data[index].id);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            response,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                      Get.back();
                                      Get.off(SignedUsersPage());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
