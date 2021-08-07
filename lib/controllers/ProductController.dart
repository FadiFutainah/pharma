import 'dart:io';

import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/ProductModel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductController {
  ProductModel productModel = ProductModel();

  //needs edit
// ossama
  Future<String> addProduct(ProductModel productModel, int companyId) async {
    var url = baseUrl + 'inputproducts';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        // body: productModel.addProductToJson(),
      );
      if (response.statusCode == 200) {
        return 'تم إضافة المنتج بنجاح';
      } else {
        return 'يوجد خطأ في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال في الشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<List<ProductModel>> getByCompanyId(int id, int userId) async {
    var url = baseUrl + 'showproductsbycompany/$id/2';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List products = json;

        return products
            .map((product) => new ProductModel.fromJsonWithModelHossa(product))
            .toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('e');
      print(e);
      return null;
    }
  }

  Future<ProductModel> getProductByName(String name) async {
    var url = baseUrl + 'showproductsbyname/$name';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List json = convert.jsonDecode(response.body);
        print(json.toString() + 'fofofofofofofofo');
        if (json.isEmpty) {
          return ProductModel(name: 'not found');
        } else {
          return ProductModel.fromJsonWithstringHossa(json[0]);
        }
      } else {
        return ProductModel(name: 'not found');
      }
    } on Exception {
      return null;
    }
  }

  Future<List> getProductsName() async {
    var url = baseUrl + 'showproducts';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List products = json;
        List<String> string = [];
        List<ProductModel> s;
        s = products
            .map((user) => new ProductModel.fromJsonWithstringHossa(user))
            .toList();
        for (int i = 0; i < s.length; i++) {
          string.add(s[i].name);
        }
        return string;
      } else {
        return [''];
      }
    } on Exception {
      return [''];
    }
  }

  Future<List<ProductModel>> getMostWantedProducts() async {
    var url = baseUrl + 'showproducts_most_wanted';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List products = json;
        return products
            .map((product) => new ProductModel.fromJsonForMostWanted(product))
            .toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
