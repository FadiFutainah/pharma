import 'dart:convert';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/BasketsModel.dart';

class BasketsController {
  /*Future<List<BasketsModel>> getAllBaskets() async {
    var url = baseUrl + 'getall_sallats';

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List baskets = json;
      return baskets
          .map((basket) => new BasketsModel.fromJson(basket))
          .toList();
    } else {
      throw Exception('Faild To get baskets');
    }
  }*/

  Future<List<Map<String, dynamic>>> getAllBaskets() async {
    var url = baseUrl + 'getall_sallats';

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List baskets = json;
      return baskets
          .map((basket) => {
                'image': BasketsModel.fromJson(basket).image,
                'basket': BasketsModel.fromJson(basket),
              })
          .toList();
    } else {
      throw Exception('Faild To get baskets');
    }
  }

  Future<http.Response> buyBasket(BasketsModel basketsModel) async {
    var url = baseUrl + 'buysallat';
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(basketsModel.toJsonToBuy()),
    );
  }
}
