import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
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
                      'images/splash_logo.PNG',
                      fit: BoxFit.fitHeight,
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
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 18,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        var response = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .logIn(userc.text, passc.text);
                        if (Provider.of<AuthProvider>(context, listen: false)
                            .isAuthenticated) {
                          Navigator.of(context).pushNamed(HomePage.id);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(response.body)));
                          switch (response.body) {
                            case 'worng username':
                              userc.clear();
                              break;
                            case 'wrong password':
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
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffffb52d)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                      ),
                    ),
                  ),
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
