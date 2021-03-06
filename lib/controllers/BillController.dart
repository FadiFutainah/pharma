import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/AllBillsModel.dart';
import 'package:pharma/models/BillModel.dart';

class BillController {
  /*Future<List<BillModel>> getBillsByUser(int id) async {
    var url = baseUrl + 'getproductsbills/3';

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List bills = json;
        return bills.map((bill) => new BillModel.fromJson(bill)).toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }*/

  Future<AllBillsModel> getBillsByUser() async {
    var url = baseUrl + 'getproductsbill';

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        return AllBillsModel.fromJson(json);
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<String> addBill(BillModel billModel) async {
    var url = baseUrl + 'inputproductstobills';
    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(billModel.toJson()),
          )
          .timeout(Duration(seconds: 15));
      if (response.statusCode == 200) {
        if (response.body.toString().contains('???? ?????????? ???? ??????????')) {
          return '???????? ?????? ???? ?????????? ????????????';
        }
        return '???? ???????????? ??????????';
      } else {
        return '???????? ?????? ???? ?????????? ????????????';
      }
    } on SocketException {
      return '???? ???????? ?????????? ??????????????';
    } on TimeoutException {
      return '???????? ?????? ???? ????????????';
    } on Exception {
      return '???????? ?????? ???? ????????????';
    }
  }
}
