import 'package:pharma/models/BillProductModel.dart';

class BillModel {
  int UserId = 0;
  int id = 0;
  int fullTotal = 0;
  String createdAt;
  List<BillProductModel> products = [];

  BillModel({
    this.id,
    this.fullTotal,
    this.createdAt,
    this.products,
  });

  BillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullTotal = json['id_user'];
    createdAt = json['created_at'];
    if (json['products'] != null) {
      products = List<BillProductModel>();
      json['products'].forEach((v) {
        products.add(BillProductModel.fromJson(v));
      });
    }
  }

/////// needs edit /////////
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> test = List<Map<String, dynamic>>();

    if (this.products != null) {
      this.products.forEach((v) {
        test.add(v.toJson1());
      });
    }

    Map<String, dynamic> map = {
      'id_user': this.UserId,
      'full_total': this.fullTotal,
      'products': test,
    };

    return map;
  }
}
