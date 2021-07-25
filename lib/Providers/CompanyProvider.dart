import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pharma/models/CompanyModel.dart';
import 'package:pharma/models/ProductModel.dart';

class CompanyProvider extends ChangeNotifier {
  //fill the list by the controller

  List<CompanyModel> _items = [];
  UnmodifiableListView<CompanyModel> get items => UnmodifiableListView(_items);

  // ignore: missing_return
  UnmodifiableListView<ProductModel> getCompanyProductsById(int id) {
    //backend call to fetch company products();
  }

  CompanyModel getCompany(int id) =>
      _items.firstWhere((element) => element.id == id);
}
