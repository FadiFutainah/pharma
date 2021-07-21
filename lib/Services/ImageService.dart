// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class PickImage extends StatefulWidget {
//   @override
//   _PickImageState createState() => new _PickImageState();
// }

// class _PickImageState extends State<PickImage> {
//   File _image;
//   ImagePicker _picker = ImagePicker();

//   Future getImage() async {
//     var image = await _picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image as File;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//       ),
//       body: Center(
//         child: _image == null ? Text('No image selected.') : Image.file(_image),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: getImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
