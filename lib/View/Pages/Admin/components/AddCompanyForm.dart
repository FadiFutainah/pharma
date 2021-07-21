import 'package:pharma/View/Pages/Admin/AddProductPage.dart';
import 'package:pharma/models/CompanyModel.dart';
import 'package:flutter/material.dart';

//new edit
class AddCompanyForm extends StatefulWidget {
  @override
  _AddCompanyFormState createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  Future<List<CompanyModel>> futureCompanies;
  List<CompanyModel> companies;

  @override
  void initState() {
    companies = futureCompanies.asStream().toList() as List<CompanyModel>;
    super.initState();
  }

  // final _formKey = GlobalKey<FormState>();
  TextEditingController nameFieldController;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: nameFieldController,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              ),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(180, 106, 103, 112),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                labelText: 'اسم الشركة',
                labelStyle: TextStyle(
                  color: Color.fromARGB(180, 106, 103, 112),
                  fontSize: 18,
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.height / 18,
              color: Theme.of(context).primaryColor,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AddProductPage.id);
                },
                child: Text(
                  'إضافة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  // int id;
  // String name;
  // int quantity;
  // int sale;
  // int addSale;
  // int price;
  // int hossa;
  // DateTime createdAt;


  