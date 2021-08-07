import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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
  String path;
  File file;
  // Future<List<CompanyModel>> futureCompanies;
  // List<CompanyModel> companies;

  // @override
  // void initState() {
  //   companies = futureCompanies.asStream().toList() as List<CompanyModel>;
  //   super.initState();
  // }

  void pickercamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfile.path);
    });
  }

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
              IconButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile image =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  var file = File(image.path);
                  print(image.path);
                  print(file.path);
                  final temp = await getApplicationDocumentsDirectory();
                  print(temp);
                },
                icon: Icon(Icons.add_a_photo_outlined),
                iconSize: 50,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                text: 'إضافة',
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // String res = await widget.companyController
                    //     .addCompany('company name', path);
                    pickercamera();
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


      // final ImagePicker _picker = ImagePicker();
      //             final File image = (await _picker.pickImage(
      //                 source: ImageSource.gallery)) as File;
      //             print('path');
      //             print(path);
      //             print('image.path');
      //             print(image.path);
      //             final Directory apppath =
      //                 await getApplicationDocumentsDirectory();

      //             File temp = await image.copy('${apppath.path}/fofo.jpg');
      //             path = temp.path;
      //             print('path');
      //             print(path);