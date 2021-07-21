import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(180, 106, 103, 112),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelText: 'اسم المستخدم',
          labelStyle: TextStyle(
            color: Color.fromARGB(180, 106, 103, 112),
            fontSize: 16,
          ),
        ),
        validator: (value) {
          if (value.length < 4) {
            return 'اسم المستخدم قصير للغاية';
          }
          return null;
        },
      ),
    );
  }
}
