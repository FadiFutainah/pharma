import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';

class TempPage extends StatelessWidget {
  static const String id = '/TempPage';
  final TextEditingController controller;

  const TempPage({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'تغيير الصلاحية',
          style: TextStyle(
            color: Colors.white,
            fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(180, 106, 103, 112),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  labelText: 'URL',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(180, 106, 103, 112),
                    fontSize: 16,
                  ),
                ),
                controller: controller,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  editableUrl = controller.text;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
