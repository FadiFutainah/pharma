import 'package:pharma/models/BillSallatModel.dart';

import 'BillModel.dart';

class AllBillsModel {
  List<BillModel> billModel;
  List<BillSallatModel> billSallatModel;

  AllBillsModel({
    this.billModel,
    this.billSallatModel,
  });

  AllBillsModel.fromJson(Map<String, dynamic> json) {
    if (json['bills'] != null) {
      billModel = [];
      json['bills'].forEach((v) {
        billModel.add(BillModel.fromJson(v));
      });
    }
    if (json['sallat'] != null) {
      billSallatModel = [];
      json['sallat'].forEach((v) {
        billSallatModel.add(BillSallatModel.fromJson(v));
      });
    }
  }
}
