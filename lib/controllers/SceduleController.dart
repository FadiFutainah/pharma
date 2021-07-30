import 'package:pharma/Common/consts.dart';
import 'package:http/http.dart' as http;

class ScedualController {
  Future<String> uploadScedual(String imagePath) async {
    var url = baseUrl + 'uploadimageschedule';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imagePath,
        ),
      );
      final response = await request.send();
      if (response.statusCode == 200) {
        return '';
      } else {
        return '';
      }
    } on Exception {
      return '';
    }
  }
}
