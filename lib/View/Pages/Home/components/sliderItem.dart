import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Image image;

  const ImageSlider({Key key, this.image}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'العرض ',
            textAlign: TextAlign.center,
          ),
          children: [
            Container(
              child: Center(child: Text('العرض')),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _showDialog(context);
        });
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            'images/images (4).jpg',
          ),
        ),
      ),
    );
  }
}
