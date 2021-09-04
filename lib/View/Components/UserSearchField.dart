import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:pharma/controllers/AdminController.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:textfield_search/textfield_search.dart';

class UserSearchField extends StatefulWidget {
  final List<UserModel> users;
  final TextEditingController textEditingController = TextEditingController();

  UserSearchField({this.users});
  @override
  _UserSearchFieldState createState() => _UserSearchFieldState();
}

class _UserSearchFieldState extends State<UserSearchField> {
  AdminController adminController = AdminController();
  Future<List<String>> futureUsersNames;
  @override
  void initState() {
    super.initState();
    futureUsersNames = adminController.getUsersName(widget.users);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 55),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFieldSearch(
            label: 'search',
            controller: widget.textEditingController,
            future: () {
              return futureUsersNames;
            },
            minStringLength: 0,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  UserModel user = widget.users.firstWhere(
                      (i) => i.name == widget.textEditingController.text);
                  if (user != null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.45,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: GridView(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 35,
                                    ),
                                    children: [
                                      Text('رقم الهاتف'),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                          child: Text(user.phone.toString()),
                                        ),
                                      ),
                                      Text('رقم الجوال'),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Center(
                                          child:
                                              Text(user.mobilePhone.toString()),
                                        ),
                                      ),
                                      Text('العنوان'),
                                      SingleChildScrollView(
                                        child: Center(
                                          child: Text(
                                            user.address.toString(),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                      Text('كلمة السر'),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                          child: Text(user.password),
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
                  }
                },
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              hintStyle: TextStyle(
                package: 'google_fonts_arabic',
                fontFamily: ArabicFonts.Cairo,
              ),
              hintText: 'البحث',
              alignLabelWithHint: true,
              hintTextDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
