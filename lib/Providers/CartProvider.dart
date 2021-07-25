import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pharma/Services/Services.dart';
import 'package:pharma/models/BillProductModel.dart';
import 'package:pharma/models/ProductModel.dart';

class Cart extends ChangeNotifier {
  final List<TableRow> _items = [];
  final List<BillProductModel> _products = [];
  final List<ProductModel> _productsModel = [];
// needs edit
  int selectedId;

  UnmodifiableListView<TableRow> get items => UnmodifiableListView(_items);
  UnmodifiableListView<BillProductModel> get products =>
      UnmodifiableListView(_products);
  List<ProductModel> get product => _productsModel;

  double total() {
    double total = 0;

    for (int i = 0; i < _items.length; i++) {
      Text a = _items[i].children[0];
      total = total + double.parse(a.data);
    }

    return total;
  }

  int searchModel(ProductModel model) {
    for (int i = 0; i < _productsModel.length; i++) {
      if (_productsModel[i].id == model.id) {
        return i;
      }
    }
    return -1;
  }

  int searchItem(ProductModel model) {
    for (int i = 0; i < _items.length; i++) {
      print(_items[i].children[4].toString());
      Text t = _items[i].children[4];
      if (t.data.toString() == model.name) {
        print('malazzzzzzzzzzz' + i.toString());
        return i;
      }
    }
    return -1;
  }

  int searchProduct(product) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == product.id) {
        return i;
      }
    }
    return -1;
  }

  void addItem(
      ProductModel model, double quentity, BillProductModel billProductModel) {
    if (searchProduct(model) != -1) {
      _productsModel.removeAt(searchModel(model));
      _items.removeAt(searchItem(model));
      _products.removeAt(searchProduct(model));
      _items.add(Services.makeTableRow(model, quentity));
      _productsModel.add(model);
      _products.add(billProductModel);
      notifyListeners();
    } else {
      _items.add(Services.makeTableRow(model, quentity));
      _productsModel.add(model);
      _products.add(billProductModel);
      notifyListeners();
    }
  }

  // void deleteItem(ProductModel productModel) {
  //   _items.removeAt(searchItem(productModel));
  //   _products.removeAt(searchProduct(productModel));
  //   _productsModel.removeAt(searchModel(productModel));
  // }

  /// fadi this the how to delete a product from a cart lovee you ///

  void deleteItemFromCart(ProductModel productModel) {
    _productsModel.removeAt(searchModel(productModel));
    _items.removeAt(searchItem(productModel));
    _products.removeAt(searchProduct(productModel));
    notifyListeners();
  }

  void removeAll() {
    _items.clear();

    _products.clear();
    _productsModel.clear();
    notifyListeners();
  }
}
