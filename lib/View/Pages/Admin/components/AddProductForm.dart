import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/View/Components/MyTextField.dart';

import 'package:flutter/material.dart';

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
  var selected;
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: DropdownButton(
                  isExpanded: true,
                  value: null,
                  items: <DropdownMenuItem>[
                    DropdownMenuItem(
                      value: 'الفارس',
                      child: Text(
                        'الفارس',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'مياميد',
                      child: Text(
                        'مياميد',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'فارما',
                      child: Text(
                        'فارما',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'البلسم',
                      child: Text(
                        'البلسم',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selected = value;
                    });
                  },
                  hint: selected != null
                      ? Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(selected))
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text('اختر الشركة من فضلك')),
                ),
              ),

// sale  addsale

              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              MyButton(
                text: 'إضافة',
                width: MediaQuery.of(context).size.width / 2,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(namec.text);
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

//  Container(
//                 width: MediaQuery.of(context).size.width / 2,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       print(namec.text);
//                     }
//                   },
//                   child: Text(
//                     'إضافة',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xffffb52d)),
//                   ),
//                 ),
//               ),
//             ],
//           ), Container(
//                 width: MediaQuery.of(context).size.width / 2,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       print(namec.text);
//                     }
//                   },
//                   child: Text(
//                     'إضافة',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xffffb52d)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
