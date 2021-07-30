// !!!

import 'HossaProductModel.dart';

class ProductModel {
  int id;
  String name;
  int quantity;
  int sale;
  int addSale;
  int price;
  int hossa;
  String nameHossa;
  HossaProductModel hossaProduct;
  // String formation;
  // List<String> alternatives;
  // int max;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.addSale,
    this.sale,
    this.hossa,
    this.nameHossa,
    this.hossaProduct,
  });

  ProductModel.fromJsonWithModelHossa(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['tahmel'];

    ///print(json['name_hossa']);
    ///print(HossaProductModel.fromJson(json['name_hossa']));
    if (json['name_tahmel'] != null) {
      hossaProduct = HossaProductModel.fromJson(json['name_tahmel']);
    }

    print(hossaProduct);
    //nameHossa = json['name_hossa'];
  }

  ProductModel.fromJsonWithstringHossa(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['tahmel'];
    nameHossa = json['name_tahmel'];
    //nameHossa = json['name_hossa'];
  }

  ProductModel.fromJsonForMostWanted(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['tahmel'];
    nameHossa = json['name_tahmel'];
  }

  ProductModel.fromJsonSallat(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['tahmel'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'price': this.price,
        'quantity': this.quantity,
        'sale': this.sale,
        'addSale': this.addSale,
        'tahmel': this.hossa,
      };
}
