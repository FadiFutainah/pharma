import 'HossaProductModel.dart';

class ProductModel {
  int id;
  String name;
  int quantity;
  int sale;
  int addSale;
  int price;
  int hossa;
  int addTahmel;
  String nameHossa;
  HossaProductModel hossaProduct;
  int maxHossa;
  int maxHossaModify;
  int companyId;
  String nameTahmel;
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
    this.maxHossa,
    this.maxHossaModify,
    this.addTahmel,
    this.companyId,
    this.nameTahmel,
  });

  ProductModel.fromJsonWithModelHossa(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addSale = json['add_sale'];
    hossa = json['tahmel'];
    addTahmel = json["add_tahmel"];
    if (json['name_tahmel'] != null) {
      hossaProduct = HossaProductModel.fromJson(json['name_tahmel']);
    }

    maxHossa = json["max_hossa"];
    maxHossaModify = json["max_hossa_modify"];

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
    maxHossa = json["max_hossa"];
    maxHossaModify = json["max_hossa_modify"];
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
    addTahmel = json["add_tahmel"];
    nameHossa = json['name_tahmel'];
    maxHossa = json["max_hossa"];
    maxHossaModify = json["max_hossa_modify"];
  }

  ProductModel.fromJsonSallat(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name_product'];
    price = json['price'];
    quantity = json['quantity'];
    sale = json['sale'];
    addTahmel = json["add_tahmel"];
    addSale = json['add_sale'];
    hossa = json['tahmel'];
    maxHossa = json["max_hossa"];
    maxHossaModify = json["max_hossa_modify"];
  }

  Map<String, dynamic> toJsonForAdd() => {
        'name_product': this.name,
        'price': this.price,
        'quantity': this.quantity,
        'sale': this.sale,
        'add_sale': this.addSale,
        'tahmel': this.hossa,
        'max_hossa': this.maxHossa,
        'id_company': this.companyId,
        'name_tahmel': this.nameTahmel,
      };
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
