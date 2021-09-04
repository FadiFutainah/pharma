import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyPasswordField.dart';
import 'package:pharma/View/Components/MyTextField.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/models/UserModel.dart';
import 'package:provider/provider.dart';

import '../WelcomePage.dart';

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
      appBar: GeneralAppBar(title: 'تسجيل الدخول', hasShoppingCart: false),
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
                  controller: pharNamec,
                  labelText: 'اسم الصيدلية',
                  type: TextInputType.text,
                  validator: (String value) {
                    if (value.length < 4) return 'اسم الصيدلية قصير للغاية';
                    return null;
                  },
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
                MyTextField(
                  controller: addressc,
                  labelText: 'العنوان بالتفصيل',
                  type: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) return 'ادخل العنوان من فضلك';
                    return null;
                  },
                ),
                MyTextField(
                  controller: mobNumc,
                  labelText: 'رقم الموبايل',
                  type: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) return 'ادخل رقم الجوال من فضلك';
                    if (num.tryParse(value) == null)
                      return 'ادخل رقماً من فضلك';
                    return null;
                  },
                ),
                MyTextField(
                  controller: numc,
                  labelText: 'رقم الصيدلية',
                  type: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) return 'ادخل رقم الصيدلية من فضلك';
                    if (num.tryParse(value) == null)
                      return 'ادخل رقماً من فضلك';
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
                MyButton(
                  width: MediaQuery.of(context).size.width * 0.45,
                  text: 'تسجيل',
                  onPressed: () async {
                    if (passc.text.length > 7 &&
                        confirmPassc.text != passc.text) {
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
                      showSnackBar(response, context);
                      if (response == 'تم التسجيل بنجاح') {
                        Navigator.of(context).pushNamed(WelcomePage.id);
                      }
                    }
                  },
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
