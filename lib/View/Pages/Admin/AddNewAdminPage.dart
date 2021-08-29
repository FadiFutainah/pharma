import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Components/MyPasswordField.dart';
import 'package:pharma/View/Components/MyTextField.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Pages/WelcomePage.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:provider/provider.dart';

class AddNewAdminPage extends StatefulWidget {
  static const String id = 'AddNewAdminPage';

  @override
  _AddNewAdminPageState createState() => _AddNewAdminPageState();
}

class _AddNewAdminPageState extends State<AddNewAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namec = TextEditingController();

  final TextEditingController passc = TextEditingController();
  final TextEditingController confirmPassc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GeneralAppBar(title: 'إضافة مدير', hasShoppingCart: false),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                MyTextField(
                  controller: namec,
                  labelText: 'الاسم الكامل',
                  type: TextInputType.text,
                  validator: (String value) {
                    if (value.length < 4) return 'اسم المستخدم قصير للغاية';
                    return null;
                  },
                ),
                MyPasswordField(
                  controller: passc,
                  labelText: 'كلمة المرور',
                  validator: (String value) {
                    if (value.length < 7)
                      return 'كلمة السر يجب أن تكون ثماني محارف على الأقل';
                    return null;
                  },
                ),
                MyPasswordField(
                  controller: confirmPassc,
                  labelText: 'تأكيد كلمة المرور',
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'تأكيد كلمة المرور لا يطابق كلمة المرور';
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (passc.text.length > 7 &&
                          confirmPassc.text != passc.text) {
                        confirmPassc.clear();
                      }
                      if (_formKey.currentState.validate()) {
                        // var response = await Provider.of<AuthProvider>(context,
                        //         listen: false)
                        //     .signup(
                        //   UserModel(

                        //     password: passc.text,
                        //   ),
                        // );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'response',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                        if ('response' == 'تم التسجيل بنجاح') {
                          Get.to(WelcomePage());
                        }
                      }
                    },
                    child: Text(
                      'إضافة',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffffb52d)),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
