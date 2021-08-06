import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyTextField.dart';

import 'package:flutter/material.dart';
import 'package:pharma/controllers/CompanyController.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/CompanyModel.dart';
import 'package:pharma/models/ProductModel.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namec = TextEditingController();
  final TextEditingController quantityc = TextEditingController();
  final TextEditingController maxc = TextEditingController();
  final TextEditingController pricec = TextEditingController();
  final TextEditingController salec = TextEditingController();
  final TextEditingController addSalec = TextEditingController();
  final TextEditingController tahmelc = TextEditingController();

  CompanyController companyController = CompanyController();
  ProductController productController = ProductController();
  String selectedCompany = 'اختر الشركة من فضلك';
  String selectedMedcine = 'الدواء المحمل';
  List<CompanyModel> companies = [];
  List<String> products = [];
  List<PopupMenuEntry<String>> buildDropdownCompanyItems(
      List<CompanyModel> companies) {
    List<PopupMenuEntry<String>> items = [];
    for (CompanyModel company in companies) {
      items.add(
        PopupMenuItem(
          child: ListTile(
            title: SizedBox(
              child: Text(
                company.name,
                textAlign: TextAlign.right,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          value: company.name,
        ),
      );
    }
    return items;
  }

  List<PopupMenuEntry<String>> buildDropdownProductItems(
      List<String> products) {
    List<PopupMenuEntry<String>> items = [];

    for (String product in products) {
      items.add(
        PopupMenuItem(
          child: ListTile(
            title: SizedBox(
              child: Text(
                product,
                textAlign: TextAlign.right,
              ),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          value: product,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    companyController.getCompanies().then((value) => companies = value);
    productController.getProductsName().then((value) => products = value);
    super.initState();
  }

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
                labelText: 'اسم الدواء',
                type: TextInputType.text,
                validator: (String value) {
                  if (value == '') return 'اسم الدواء لا يجب أن يكون فارغاً';
                  return null;
                },
              ),
              MyTextField(
                controller: quantityc,
                labelText: 'الكمية',
                type: TextInputType.number,
                validator: (String value) {
                  if (value == '') return 'ادخل الكمية من فضلك';
                  if (num.tryParse(value) == null) return 'ادخل رقماً من فضلك';
                  return null;
                },
              ),
              MyTextField(
                controller: maxc,
                labelText: 'الحصة الأسبوعية',
                type: TextInputType.number,
                validator: (String value) {
                  if (value == '')
                    return null;
                  else if (num.tryParse(value) == null)
                    return 'ادخل رقماً من فضلك';
                  return null;
                },
              ),
              MyTextField(
                controller: pricec,
                labelText: 'السعر',
                type: TextInputType.number,
                validator: (String value) {
                  if (value == '') return 'ادخل السعر من فضلك';
                  if (num.tryParse(value) == null)
                    return 'السعر يجب أن يكون رقماً';
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: salec,
                        labelText: 'المجاني',
                        type: TextInputType.number,
                        validator: (String value) {
                          if (value != '' && num.tryParse(value) == null)
                            return 'ادخل رقماً من فضلك';
                          return null;
                        },
                      ),
                    ),
                    Expanded(child: SizedBox(width: 10), flex: 1),
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: addSalec,
                        labelText: 'العرض',
                        type: TextInputType.number,
                        validator: (String value) {
                          if (value != '' && num.tryParse(value) == null)
                            return 'ادخل رقماً من فضلك';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MyTextField(
                        controller: tahmelc,
                        labelText: 'كمية التحميل',
                        type: TextInputType.number,
                        validator: (String value) {
                          if (value == '')
                            return null;
                          else if (num.tryParse(value) == null)
                            return 'ادخل رقماً من فضلك';
                          return null;
                        },
                      ),
                    ),
                    Expanded(child: SizedBox(width: 10), flex: 1),
                    Expanded(
                      flex: 3,
                      child: PopupMenuButton(
                        onSelected: (String value) {
                          setState(() {
                            selectedMedcine = value;
                          });
                        },
                        itemBuilder: (context) =>
                            buildDropdownProductItems(products),
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            Text(selectedMedcine,
                                style: TextStyle(fontSize: 16)),
                            Divider(color: Colors.grey[600]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: PopupMenuButton(
                  onSelected: (String value) {
                    setState(() {
                      selectedCompany = value;
                    });
                  },
                  itemBuilder: (context) =>
                      buildDropdownCompanyItems(companies),
                  child: Column(
                    children: [
                      Text(selectedCompany, style: TextStyle(fontSize: 16)),
                      Divider(color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              MyButton(
                text: 'إضافة',
                width: MediaQuery.of(context).size.width / 2,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (selectedCompany == 'اختر الشركة من فضلك') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            selectedCompany,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      productController.addProduct(
                        ProductModel(
                          name: namec.text,
                          addSale: int.parse(salec.text),
                          hossa: int.parse(maxc.text),
                          price: int.parse(pricec.text),
                          quantity: int.parse(quantityc.text),
                          sale: int.parse(salec.text),
                        ),
                        companies
                            .where((element) => element.name == selectedCompany)
                            .first
                            .id,
                      );
                    }
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
