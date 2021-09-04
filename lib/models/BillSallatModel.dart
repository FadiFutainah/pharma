import 'package:pharma/models/BasketModel.dart';

class BillSallatModel {
  int id = 0;
  String createdAt = '';
  BasketsModel sallat = BasketsModel();

  BillSallatModel({this.id, this.createdAt, this.sallat});

  BillSallatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    sallat = BasketsModel.fromJson(json['sallat']);
  }
}
