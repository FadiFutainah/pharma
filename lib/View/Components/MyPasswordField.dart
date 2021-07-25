import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String Function(String) validator;
  const MyPasswordField({
    Key key,
    this.labelText,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: widget.controller,
          obscureText: invisible,
          cursorColor: const Color(0xffffb52d),
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
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: Color.fromARGB(180, 106, 103, 112),
              fontSize: 16,
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
