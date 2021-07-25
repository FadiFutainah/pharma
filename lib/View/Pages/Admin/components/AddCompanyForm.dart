import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyTextField.dart';
import 'package:flutter/material.dart';

class AddCompanyForm extends StatefulWidget {
  @override
  _AddCompanyFormState createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namec = TextEditingController();
  // Future<List<CompanyModel>> futureCompanies;
  // List<CompanyModel> companies;

  // @override
  // void initState() {
  //   companies = futureCompanies.asStream().toList() as List<CompanyModel>;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
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
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                text: 'إضافة',
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
