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
  final TextEditingController totalc = TextEditingController();
  final TextEditingController numc = TextEditingController();
  final TextEditingController numPc = TextEditingController();

  List<String> products = [
    'سيتامول',
    'بانادول',
    'اوغمنتين',
    'اونيم',
    'سيفبودوماس',
  ];

  String selected = 'إضافة دواء';

  List<String> selectedProducts = [];

  List<Widget> buildSelectedProducts(List<String> products) {
    List<Widget> items = [];
    for (var product in products) {
      items.add(
        InputChip(
          label: Text(
            product,
            textAlign: TextAlign.right,
          ),
          onDeleted: () {
            setState(() {
              selectedProducts.removeWhere((element) => element == product);
            });
          },
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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              MyTextField(
                controller: namec,
                labelText: 'اسم العرض',
                type: TextInputType.text,
                validator: (String value) {
                  if (value.isEmpty) return 'ادخل اسم العرض من فضلك';
                  return null;
                },
              ),
              MyTextField(
                controller: numc,
                labelText: 'عدد السلات',
                type: TextInputType.text,
                validator: (String value) {
                  if (value.isEmpty) return 'ادخل عدد السلات من فضلك';
                  if (num.tryParse(value) == null) return 'ادخل رقماً من فضلك';
                  return null;
                },
              ),
              MyTextField(
                controller: totalc,
                labelText: 'السعر النهائي',
                type: TextInputType.text,
                validator: (String value) {
                  if (value.isEmpty) return 'ادخل السعر من فضلك';
                  if (num.tryParse(value) == null) return 'ادخل رقماً من فضلك';
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
                        controller: numPc,
                        labelText: 'العدد',
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
                      child: PopupMenuButton(
                        onSelected: (String value) {
                          setState(() {
                            selected = value;
                          });
                        },
                        itemBuilder: (context) =>
                            buildDropdownProductItems(products),
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            Text(selected, style: TextStyle(fontSize: 16)),
                            Divider(color: Colors.grey[600]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                text: 'إضافة',
                onPressed: () {
                  if (selected == 'إضافة دواء') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'اختر دواء من فضلك',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    setState(() {
                      selectedProducts.add(selected);
                    });
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 8,
                    children: buildSelectedProducts(selectedProducts),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              MyButton(
                width: MediaQuery.of(context).size.width * 0.5,
                text: 'ارسال',
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).popAndPushNamed(HomePage.id);
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
