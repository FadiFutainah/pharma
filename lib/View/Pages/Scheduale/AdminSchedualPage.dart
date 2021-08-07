import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/controllers/SceduleController.dart';

class AdminSchedualPage extends StatelessWidget {
  static const String id = 'Adminschedual';
  final SchedualController schedualController = SchedualController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.network(
          schedUrl,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(child: CircularProgressIndicator());
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Center(child: Text('لا يوجد اتصال بالشبكة'));
          },
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // needs edit
          String res = await schedualController
              .uploadScedual('F:\\Desktop\\photos\\screenat\\schedual.jpg');
          if (res == 'uploaded') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'تم رفع الصورة بنجاح',
                  textAlign: TextAlign.center,
                ),
              ),
            );
            Navigator.of(context).pushNamed(AdminHomePage.id);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  res,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xffffb52d),
      ),
    );
  }
}
