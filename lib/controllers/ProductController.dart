import 'dart:io';

import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/ProductModel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductController {
  ProductModel productModel = ProductModel();

  //needs edit

  // Future<String> addProduct(ProductModel productModel) async {
  //   var url = baseUrl + 'inputproduct';
  //   Uri uri = Uri.parse(url);
  //   final response = await http.post(
  //     uri,
  //     body: productModel.addProductToJson(),
  //   );
  //   if (response.statusCode == 200) {
  //     return 'تم إضافة المنتج بنجاح';
  //   }

  // }

  Future<List<ProductModel>> getByCompanyId(int id) async {
    var url = baseUrl + 'showproductsbycompany/$id';
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
            .map((product) => new ProductModel.fromJson(product))
            .toList();
      } else {
        return null;
      }
    } on Exception {
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
        if (json.isEmpty) {
          return ProductModel(name: 'not found');
        } else {
          return ProductModel.fromJson(json[0]);
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
        List<String> string = [''];
        List<ProductModel> s;
        s = products.map((user) => new ProductModel.fromJson(user)).toList();
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
            .map((product) => new ProductModel.fromJson(product))
            .toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
