import 'package:flutter/material.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:provider/provider.dart';

import 'components/SignUpPasswordField.dart';
import 'components/SignUpTextField.dart';
import 'components/bar.dart';

class SignUp extends StatefulWidget {
  static const String id = 'SignUp';

  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController pharNamec = TextEditingController();
  final TextEditingController namec = TextEditingController();
  final TextEditingController addressc = TextEditingController();
  final TextEditingController mobNumc = TextEditingController();
  final TextEditingController numc = TextEditingController();
  final TextEditingController passc = TextEditingController();
  final TextEditingController confirmPassc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Bar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                SignUpTextField(
                  controller: pharNamec,
                  labelText: 'اسم الصيدلية',
                  hintText: 'ادخل اسم الصيدلية من فضلك',
                ),
                SignUpTextField(
                  controller: namec,
                  labelText: 'الاسم الكامل',
                  hintText: 'ادخل الاسم الكامل من فضلك',
                ),
                SignUpTextField(
                  controller: addressc,
                  labelText: 'العنوان',
                  hintText: 'ادخل العنوان من فضلك',
                ),
                SignUpTextField(
                  controller: mobNumc,
                  labelText: 'رقم الموبايل',
                  hintText: 'ادخل رقم الصيدلية من فضلك',
                ),
                SignUpTextField(
                  controller: numc,
                  labelText: 'رقم الصيدلية',
                  hintText: 'ادخل رقم الصيدلية من فضلك',
                ),
                SignUpPasswordField(
                  controller: passc,
                  labelText: 'كلمة المرور',
                  hintText: 'كلمة السر يجب أن تكون ثماني محارف على الأقل',
                ),
                SignUpPasswordField(
                  controller: confirmPassc,
                  labelText: 'تأكيد كلمة المرور',
                  hintText: 'تأكيد كلمة المرور لا يطابق كلمة المرور',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (confirmPassc.text != passc.text) {
                        confirmPassc.clear();
                      }
                      if (_formKey.currentState.validate()) {
                        var response = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .signup(
                          UserModel(
                            pharmacyName: pharNamec.text,
                            name: namec.text,
                            address: addressc.text,
                            phone: numc.text,
                            mobilePhone: mobNumc.text,
                            password: passc.text,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          response,
                          textAlign: TextAlign.center,
                        )));
                        if (response == 'تم التسجيل بنجاح') {
                          Navigator.popAndPushNamed(context, HomePage.id);
                        }
                      } else {
                        passc.clear();
                      }
                    },
                    child: Text(
                      'تسجيل',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
