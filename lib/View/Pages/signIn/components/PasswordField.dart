import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({Key key, this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: widget.controller,
        obscureText: invisible,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              (invisible)
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                invisible = !invisible;
              });
            },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(180, 106, 103, 112),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: 'كلمة المرور',
          labelStyle: TextStyle(
            color: Color.fromARGB(180, 106, 103, 112),
            fontSize: 16,
          ),
        ),
        validator: (value) {
          if (value.length < 8) {
            return 'كلمة السر يجب أن تكون ثماني محارف على الأقل';
          }
          return null;
        },
      ),
    );
  }
}
