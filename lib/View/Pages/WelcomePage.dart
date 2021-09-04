import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';

class WelcomePage extends StatelessWidget {
  static const String id = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'أهلاً وسهلاً', hasShoppingCart: false),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child: Text(
                  'سيتم التواصل معكم لتأكد المعلومات ونرحب باقتراحاتكم نأمل أن نقدم لكم الفائدة دائماً',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            GestureDetector(
              onTap: () {
                Get.offAll(HomePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back, color: Colors.grey[700]),
                  Text('   عودة إلى الصفحة الرئيسية',
                      style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
