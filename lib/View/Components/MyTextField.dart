import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextInputType type;
  const MyTextField({
    Key key,
    this.labelText,
    this.controller,
    this.validator,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          keyboardType: type,
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
          validator: validator,
        ),
      ),
    );
  }
}
