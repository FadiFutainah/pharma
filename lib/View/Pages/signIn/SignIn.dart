import 'package:get/get.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/Home/UserHomePage.dart';
import 'package:pharma/View/Pages/signUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/PasswordField.dart';
import 'components/UsernameField.dart';

class SignIn extends StatefulWidget {
  static const String id = '/SignIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userc = TextEditingController();
  final TextEditingController passc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Image.asset(
                      'images/logo.jpg',
                      fit: BoxFit.fitHeight,
                      frameBuilder: (BuildContext context, Widget child,
                          int frame, bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return child;
                        } else {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 200),
                            child: frame != null
                                ? child
                                : Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.53,
                                  ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.625,
                  alignment: Alignment.center,
                  child: UsernameField(controller: userc),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  alignment: Alignment.center,
                  child: PasswordField(controller: passc),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                MyButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  text: 'دخول',
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      var response = await Provider.of<AuthProvider>(context,
                              listen: false)
                          .logIn(userc.text, passc.text);
                      showSnackBar(response, context);
                      if (Provider.of<AuthProvider>(context, listen: false)
                          .isAuthenticated) {
                        Navigator.of(context).pushNamed(HomePage.id);
                      } else {
                        switch (response) {
                          case 'يجب عليك إنشاء حساب أولاً':
                            userc.clear();
                            break;
                          case 'كلمة السر غير صحيحة ':
                            passc.clear();
                            break;
                          default:
                            userc.clear();
                            passc.clear();
                            break;
                        }
                      }
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                TextButton(
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUp.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
