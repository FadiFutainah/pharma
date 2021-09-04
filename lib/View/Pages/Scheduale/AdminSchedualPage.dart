import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/controllers/SceduleController.dart';

class AdminSchedualPage extends StatefulWidget {
  static const String id = 'Adminschedual';

  @override
  _AdminSchedualPageState createState() => _AdminSchedualPageState();
}

class _AdminSchedualPageState extends State<AdminSchedualPage> {
  final SchedualController schedualController = SchedualController();
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تعديل الجدول', style: TextStyle(color: Colors.white)),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ImagePicker imagePicker = ImagePicker();
          XFile image =
              await imagePicker.pickImage(source: ImageSource.gallery);
          setState(() {
            file = File(image.path);
          });
          File newName = await changeFileNameOnly(file, 'scheduale.jpg');
          String res = await schedualController.uploadScedual(newName.path);
          if (res == 'uploaded') {
            showSnackBar('تم رفع الصورة بنجاح', context);
            Navigator.of(context).popAndPushNamed(AdminHomePage.id);
          } else {
            showSnackBar(res, context);
          }
        },
        label: Text('تعديل الصورة', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xffffb52d),
      ),
    );
  }
}

Future<File> changeFileNameOnly(File file, String newFileName) {
  var path = file.path;
  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var newPath = path.substring(0, lastSeparator + 1) + newFileName;
  return file.rename(newPath);
}
