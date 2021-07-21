import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const SignUpTextField({
    Key key,
    this.labelText,
    this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.black, fontSize: 17),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(180, 106, 103, 112),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffffb52d)),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Color.fromARGB(180, 106, 103, 112),
              fontSize: 16,
            ),
          ),
          cursorColor: const Color(0xffffb52d),
          validator: (value) {
            if (value.length < 3 || value.length > 20) {
              return hintText;
            }
            return null;
          },
        ),
      ),
    );
  }
}
