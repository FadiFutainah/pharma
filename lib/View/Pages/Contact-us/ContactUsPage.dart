import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  static const String id = '/Contact-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'تواصل معنا',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Color(0xffffb52d),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'إرسال',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
