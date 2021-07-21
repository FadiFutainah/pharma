//edited by malaz

import 'package:pharma/models/PivoitModal.dart';

class BillProductModel {
  int id;
  String name;
  int sallatId;
  int quantity;
  int sale;
  int addSale;
  int price;
  int hossa;
  int total;
  PivotModel pivotModel = PivotModel();
  DateTime createdAt;
  // String formation;
  // List<String> alternatives;
  // int max;

  BillProductModel({
    this.id,
    this.name,
    this.sallatId,
    this.createdAt,
    this.price,
    this.quantity,
    this.addSale,
    this.sale,
    this.hossa,
    this.total,
    this.pivotModel,
  });

  BillProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['hossa'];
    pivotModel = PivotModel.fromJson(json['pivot']);
    createdAt = json['added_date'];
  }

  BillProductModel.fromJsonSallat(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    sallatId = json['sallat_id'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() => {
        'id_product': this.id,
        'price': this.price,
        'quantity': this.quantity,
        'createdAt': this.createdAt,
        'sale': this.sale,
        'addSale': this.addSale,
        'hossa': this.hossa,
        'total': this.pivotModel.total,
        'quantity_to_bought_by_specefic_user':
            this.pivotModel.quentityToBoughtBySpeceficUser,
      };

  Map<String, dynamic> toJson1() => {
        'id_product': this.id,
        'total': this.pivotModel.total,
        'quantity_to_bought_by_specefic_user':
            this.pivotModel.quentityToBoughtBySpeceficUser,
      };
}
