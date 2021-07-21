import 'package:flutter/material.dart';

class SignUpPasswordField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  const SignUpPasswordField(
      {Key key, this.hintText, this.labelText, this.controller})
      : super(key: key);

  @override
  _SignUpPasswordFieldState createState() => _SignUpPasswordFieldState();
}

class _SignUpPasswordFieldState extends State<SignUpPasswordField> {
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
          validator: (value) {
            if (value.length < 8) {
              return widget.hintText;
            }
            return null;
          },
        ),
      ),
    );
  }
}
