import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/BillModel.dart';

class BillController {
  ///final String baseUrl = 'http://'+MyApp.uri.toString()+':8000/api/';

  Future<List<BillModel>> getBillsByUser(int id) async {
    var url = baseUrl + 'getproductsbills/$id';

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List bills = json;
      return bills.map((bill) => new BillModel.fromJson(bill)).toList();
    } else {
      throw Exception('Faild To get bills');
    }
  }

  Future<http.Response> addBill(BillModel billModel) async {
    var url = baseUrl + 'inputproductstobills';
    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(billModel.toJson()),
    );
  }
}
