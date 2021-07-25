import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';

class AddBasketForm extends StatefulWidget {
  @override
  _AddBasketFormState createState() => _AddBasketFormState();
}

class _AddBasketFormState extends State<AddBasketForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            MyTextField(
              controller: namec,
              labelText: 'اسم العرض',
              type: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) return 'ادخل اسم العرض من فضلك';
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            MyButton(
              width: MediaQuery.of(context).size.width * 0.5,
              // height: MediaQuery.of(context).size.height * ,
              text: 'إضافة',
              onPressed: () {
                Navigator.of(context).popAndPushNamed(HomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
