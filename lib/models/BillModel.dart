import 'BillProductModel.dart';

class BillModel {
  int userId = 0;
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
    fullTotal = json['full_total'];
    createdAt = json['created_at'];
    if (json['products'] != null) {
      // edited now
      // products = List<BillProductModel>();
      json['products'].forEach((v) {
        products.add(BillProductModel.fromJson(v));
      });
    }
  }

/////// needs edit /////////
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> test = [];

    if (this.products != null) {
      this.products.forEach((v) {
        test.add(v.toJson1());
      });
    }

    Map<String, dynamic> map = {
      'id_user': this.userId,
      'full_total': this.fullTotal,
      'products': test,
    };

    return map;
  }
}
