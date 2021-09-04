import 'SallatProducts.dart';

class BasketsModel {
  int id = 0;
  String sallatName = '';
  int fullTotal = 0;
  int num = 0;
  int userId = 0;
  String note = '';
  String created_at = '';
  List<SallatProducts> sallatProducts = [];

  BasketsModel({
    this.id,
    this.userId,
    this.sallatName,
    this.sallatProducts,
    this.num,
    this.fullTotal,
    this.note,
    this.created_at,
  });

  BasketsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sallatName = json['name'];
    fullTotal = json['full_total'];
    note = json['note'];
    num = json['num'];
    created_at = json[''];
    if (json['sallat_products'] != null) {
      sallatProducts = [];
      json['sallat_products'].forEach((v) {
        sallatProducts.add(SallatProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJsonToBuy() => {
        'id_user': this.userId,
        'id_sallat': this.id,
      };
  Map<String, dynamic> toJsonToAdd() {
    Map<String, dynamic> json;
    json['num'] = this.num;
    json['full_total'] = this.fullTotal;
    json['name'] = this.sallatName;
    json['products'] = List<Map<String, dynamic>>.empty();
    for (var product in this.sallatProducts) {
      json['products'].add(product.addBasketToJson());
    }
    return json;
  }
}
