// !!!

import 'package:pharma/models/CompanyModel.dart';

class ProductModel {
  int id;
  String name;
  int quantity;
  int sale;
  int addSale;
  int price;
  int hossa;
  DateTime createdAt;
  CompanyModel companyModel;
  // String formation;
  // List<String> alternatives;
  // int max;

  ProductModel({
    this.id,
    this.name,
    this.createdAt,
    this.price,
    this.quantity,
    this.addSale,
    this.sale,
    this.hossa,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['hossa'];
    createdAt = json['added_date'];
  }

  ProductModel.fromJsonSallat(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['hossa'];
    createdAt = json['added_date'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'price': this.price,
        'quantity': this.quantity,
        'createdAt': this.createdAt,
        'sale': this.sale,
        'addSale': this.addSale,
        'hossa': this.hossa,
      };

  Map<String, dynamic> addProductToJson() => {
        'name_product': this.name,
        'price': this.price,
        'quantity': this.quantity,
        'sale': this.sale,
        'add_sale': this.addSale,
        'hossa': this.hossa,
        'id_company': this.companyModel.id,
      };
}
