import 'dart:convert';

import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/BasketModel.dart';

class BasketsController {
  Future<List<Map<String, dynamic>>> getAllBaskets() async {
    var url = baseUrl + 'getallsallats';

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List baskets = json;
        return baskets
            .map((basket) => {
                  'sallatName': BasketsModel.fromJson(basket).sallatName,
                  'basket': BasketsModel.fromJson(basket),
                })
            .toList();
      }
      return null;
    } on SocketException {
      return null;
    } on Exception {
      return null;
    }
  }

  Future<String> buyBasket(BasketsModel basketsModel) async {
    var url = baseUrl + 'buysallat';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(basketsModel.toJsonToBuy()),
      );
      if (response.statusCode == 200) {
        if (response.body.toString().compareTo("لا يوجد سلة بهذه البيانات") ==
            0) {
          return response.body;
        } else if (response.body
                .toString()
                .compareTo("قد نفدت الكمية من هذه السلة") ==
            0) {
          return response.body;
        } else {
          return 'تم الشراء بنجاح';
        }
      } else {
        return 'يوجد خطأ في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'حصل خطأ في عملية الشراء';
    }
  }

  Future<String> addBasket(BasketsModel basketsModel) async {
    var url = baseUrl + 'inputfullsallat';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(basketsModel.toJsonToAdd()),
      );
      if (response.statusCode == 200) {
        return 'تم إضافة السلة بنجاح';
      } else {
        return 'يوجد خطأ في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'حصل خطأ في عملية الإضافة';
    }
  }

  // Future<String> deleteBasket(BasketsModel basketsModel) {}
}
