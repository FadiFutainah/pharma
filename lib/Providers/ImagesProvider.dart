import 'package:flutter/cupertino.dart';
import 'package:pharma/Common/consts.dart';

class ImagesProvider {
  void loadAsset(BuildContext context, String assetName) {
    ImageProvider provider = AssetImage(assetName);
    precacheImage(provider, context);
  }

  void loadLogo(BuildContext context) {
    ImageProvider provider = AssetImage('images/logo.jpg');
    precacheImage(provider, context);
  }

  void loadScheduale(BuildContext context) {
    ImageProvider provider = NetworkImage(schedUrl);
    precacheImage(provider, context);
  }
}
