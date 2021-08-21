import 'package:flutter/cupertino.dart';
import 'package:pharma/Services/Services.dart';
import 'package:pharma/models/BillProductModel.dart';
import 'package:pharma/models/HossaProductModel.dart';
import 'package:pharma/models/ProductModel.dart';

class Cart extends ChangeNotifier {
  final List<TableRow> _productItems = [];
  final List<TableRow> _hossaItems = [];
  final List<ProductModel> _productsModel = [];
  final List<HossaProductModel> _hossaProducts = [];
  final List<BillProductModel> _billProduct = [];
  final List<BillProductModel> _billHossa = [];
  String _billRespons;
  String _basketRespons = '';

  String get billRespons => this._billRespons;

  set billRespons(String value) => this._billRespons = value;

  String get basketRespons => this._basketRespons;

  set basketRespons(value) => this._basketRespons = value;

  double total = 0;

  List<TableRow> get productitems => _productItems;
  List<TableRow> get hossaitems => _hossaItems;
  List<BillProductModel> get billProducts => _billProduct;
  List<BillProductModel> get billHossa => _billHossa;
  List<ProductModel> get product => _productsModel;
  List<HossaProductModel> get hossaProducts => _hossaProducts;

  void totalCounter() {
    total = 0;

    for (int i = 0; i < _productItems.length; i++) {
      Text a = _productItems[i].children[0];
      total = total + double.parse(a.data);
    }

    for (int i = 0; i < _hossaItems.length; i++) {
      Text b = _hossaItems[i].children[0];
      total = total + double.parse(b.data);
    }
  }

  int searchProduct(ProductModel model) {
    for (int i = 0; i < _productsModel.length; i++) {
      if (_productsModel[i].id == model.id) {
        return i;
      }
    }
    return -1;
  }

  int searchHossa(HossaProductModel model) {
    for (int i = 0; i < _hossaProducts.length; i++) {
      if (_hossaProducts[i].name.compareTo(model.name) == 0) {
        return i;
      }
    }
    return -1;
  }

  int searchProductItem(ProductModel model) {
    for (int i = 0; i < _productItems.length; i++) {
      Text t = _productItems[i].children[4];
      if (t.data.toString().compareTo(model.name) == 0) {
        return i;
      }
    }
    return -1;
  }

  int searchBillProductItems(ProductModel model) {
    for (int i = 0; i < _billProduct.length; i++) {
      if (_billProduct[i].id == model.id) {
        return i;
      }
    }
    return -1;
  }

  int searchBillHossaItems(model) {
    for (int i = 0; i < _billHossa.length; i++) {
      if (_billHossa[i].id == model.id) {
        return i;
      }
    }
    return -1;
  }

  int searchHossaItem(hossa) {
    for (int i = 0; i < _hossaItems.length; i++) {
      Text name = _hossaItems[i].children[4];

      ///Text quantityItem = _hossaItems[i].children[3];
      if (name.data.compareTo(hossa.name) == 0) {
        return i;
      }
    }
    return -1;
  }

  void addItem(ProductModel model, int quentity) {
    int temp = 0;

    if (model.hossa != null && model.hossa != 0) {
      temp = quentity ~/ model.hossa;
    }

    if (searchProduct(model) != -1) {
      if (searchHossaItem(model.hossaProduct) != -1) {
        _hossaProducts.removeAt(searchHossa(model.hossaProduct));
        _hossaItems.removeAt(searchHossaItem(model.hossaProduct));
        _billProduct.removeAt(searchBillProductItems(model));
        _billHossa.removeAt(searchBillHossaItems(model.hossaProduct));

        ///_items[searchItem(model)] = Services.makeTableRow(model, quentity);
        _productItems.removeAt(searchProductItem(model));
        _productsModel.removeAt(searchProduct(model));

        if (temp >= 1) {
          addHossaItem(model.hossaProduct, model.addTahmel.toDouble() * temp);
        }

        _billProduct.add(Services.convertProductToBillProduct(model, quentity));
        _productItems.add(Services.makeTableRow(model, quentity.toDouble()));
        _productsModel.add(model);
        totalCounter();
        notifyListeners();
        return;
      } else {
        _billProduct.removeAt(searchBillProductItems(model));

        ///_items[searchItem(model)] = Services.makeTableRow(model, quentity);
        _productItems.removeAt(searchProductItem(model));
        _productsModel.removeAt(searchProduct(model));

        if (model.hossaProduct != null && quentity >= model.hossa) {
          addHossaItem(model.hossaProduct, model.addTahmel.toDouble() * temp);
        }

        _billProduct.add(Services.convertProductToBillProduct(model, quentity));
        _productItems.add(Services.makeTableRow(model, quentity.toDouble()));
        _productsModel.add(model);
        totalCounter();
        notifyListeners();
        return;
      }
    } else {
      if (model.hossaProduct != null && quentity >= model.hossa) {
        _billProduct.add(Services.convertProductToBillProduct(model, quentity));
        _productItems.add(Services.makeTableRow(model, quentity.toDouble()));

        addHossaItem(model.hossaProduct, model.addTahmel.toDouble() * temp);
        _productsModel.add(model);
        totalCounter();

        notifyListeners();
        return;
      } else {
        _billProduct.add(Services.convertProductToBillProduct(model, quentity));
        _productItems.add(Services.makeTableRow(model, quentity.toDouble()));
        _productsModel.add(model);
        totalCounter();

        notifyListeners();
        return;
      }
    }
  }

  int deleteItem(ProductModel model) {
    if (searchHossaItem(model.hossaProduct) != -1) {
      _hossaProducts.removeAt(searchHossa(model.hossaProduct));
      _productItems.removeAt(searchProductItem(model));
      _hossaItems.removeAt(searchHossaItem(model.hossaProduct));
      _productsModel.removeAt(searchProduct(model));
      _billProduct.removeAt(searchBillProductItems(model));
      _billHossa.removeAt(searchBillHossaItems(model.hossaProduct));
      totalCounter();

      notifyListeners();
      return 0;
    }

    _productsModel.removeAt(searchProduct(model));
    _productItems.removeAt(searchProductItem(model));
    _billProduct.removeAt(searchBillProductItems(model));
    totalCounter();
    notifyListeners();
    return 1;
  }

  void addHossaItem(HossaProductModel hossaProductModel, double quantity) {
    ProductModel model = ProductModel();
    model =
        Services.convartFromHossaProductModelTProductModel(hossaProductModel);
    _hossaItems.add(Services.makeTableRowForHossa(model, quantity));
    _hossaProducts.add(hossaProductModel);
    _billHossa
        .add(Services.convertProductToBillProduct(model, quantity.toInt()));
    notifyListeners();
  }

  void removeAll() {
    _productItems.clear();
    _hossaItems.clear();
    _productsModel.clear();
    _hossaProducts.clear();
    _billProduct.clear();
    _billHossa.clear();
    total = 0;
    notifyListeners();
  }
}
