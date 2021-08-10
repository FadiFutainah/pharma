import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:pharma/controllers/CompanyController.dart';

class AddCompanyForm extends StatefulWidget {
  final CompanyController companyController = CompanyController();
  @override
  _AddCompanyFormState createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namec = TextEditingController();

  File file;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              MyTextField(
                controller: namec,
                labelText: 'اسم الشركة',
                type: TextInputType.text,
                validator: (String value) {
                  if (value == '') return 'ادخل اسم الشركة من فضلك';
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: (file == null)
                    ? Icon(Icons.ac_unit_outlined)
                    : Icon(Icons.access_alarm),
              ),
              IconButton(
                onPressed: () {
                  setState(() async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    file = File(image.path);
                  });
                },
                icon: Icon(Icons.add_a_photo_outlined),
                iconSize: 50,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                text: 'إضافة',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    String res = await widget.companyController
                        .addCompany('company name', file.path);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      res,
                      textAlign: TextAlign.center,
                    )));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
