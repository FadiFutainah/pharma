import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Components/MyButton.dart';
import 'package:pharma/controllers/NotesController.dart';
import 'package:pharma/models/NoteModel.dart';

class ContactUsPage extends StatelessWidget {
  final NotesController notesController = NotesController();
  final TextEditingController namec = TextEditingController();
  final TextEditingController notec = TextEditingController();
  static const String id = 'Contact-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'تواصل معنا', hasShoppingCart: false),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.center,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: namec,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(180, 106, 103, 112),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'اسم الصيدلية',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(180, 106, 103, 112),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.center,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: notec,
                      cursorColor: Theme.of(context).primaryColor,
                      maxLines: 8,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(180, 106, 103, 112),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: 'الملاحظات',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(180, 106, 103, 112),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              MyButton(
                text: 'إرسال',
                onPressed: () async {
                  var response = await notesController.sendNote(
                    NoteModel(pharmacyName: namec.text, notes: notec.text),
                  );
                  showSnackBar(response, context);
                  if (response == 'تم ارسال الرسالة بنجاح') {
                    notec.clear();
                    Navigator.of(context).pop();
                  }
                },
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
