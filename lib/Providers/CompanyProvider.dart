import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pharma/models/CompanyModel.dart';
import 'package:pharma/models/ProductModel.dart';

class CompanyProvider extends ChangeNotifier {
  //fill the list by the controller

  List<CompanyModel> _items = [
    CompanyModel(
      id: 1,
      name: 'alfares',
      image: 'images/alfares.jpeg',
    ),
    CompanyModel(
      id: 2,
      name: 'G',
      image: 'images/G.jpeg',
    ),
    CompanyModel(
      id: 3,
      name: 'bpc',
      image: 'images/bpc.jpeg',
    ),
    CompanyModel(
      id: 4,
      name: 'avenzor',
      image: 'images/avenzor.jpeg',
    ),
    CompanyModel(
      id: 5,
      name: 'medico',
      image: 'images/medico.jpeg',
    ),
    CompanyModel(
      id: 6,
      name: 'saraj',
      image: 'images/saraj.jpeg',
    ),
  ];

  UnmodifiableListView<CompanyModel> get items => UnmodifiableListView(_items);

  // ignore: missing_return
  UnmodifiableListView<ProductModel> getCompanyProductsById(int id) {
    //backend call to fetch company products();
  }

  CompanyModel getCompany(int id) =>
      _items.firstWhere((element) => element.id == id);
}
