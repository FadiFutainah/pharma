import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma/models/BillModel.dart';
import 'package:pharma/models/HossaProductModel.dart';
import 'package:pharma/models/PivoitModal.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:pharma/models/BasketsModel.dart';
import 'package:pharma/models/BillProductModel.dart';

class Services {
  static ProductModel convartFromHossaProductModelTProductModel(
      HossaProductModel hh) {
    ProductModel productModel = ProductModel();
    productModel.id = hh.id;
    productModel.name = hh.name;
    productModel.price = hh.price;
    productModel.quantity = hh.quantity;
    productModel.sale = hh.sale;
    productModel.addSale = hh.addSale;
    return productModel;
  }

  static BasketsModel makeBasketModelToBuy(int userId, int sallatId) {
    BasketsModel respons = BasketsModel();
    respons.userId = userId;
    respons.id = sallatId;
    return respons;
  }

  static BillModel makeBillModel(
      listProduct, listHossa, int id, int fullTotal) {
    for (int i = 0; i < listHossa.length; i++) {
      listProduct.add(listHossa[i]);
    }

    BillModel respons = BillModel();
    respons.UserId = 1;
    respons.fullTotal = fullTotal;
    respons.products = [];
    for (int i = 0; i < listProduct.length; i++) {
      respons.products.add(listProduct[i]);
    }
    return respons;
  }

  static BillProductModel convertProductToBillProduct(
      ProductModel model, int quentityToBoughtBySUser) {
    BillProductModel respons = BillProductModel();
    respons.id = model.id;
    respons.name = model.name;
    respons.price = model.price;
    respons.quantity = model.quantity;
    respons.sale = model.sale;
    respons.addSale = model.addSale;
    respons.hossa = model.hossa;
    PivotModel pivotModel = PivotModel();
    pivotModel.total = quentityToBoughtBySUser * model.price;
    pivotModel.quentityToBoughtBySpeceficUser = quentityToBoughtBySUser;
    respons.pivotModel = pivotModel;

    respons.pivotModel.total = quentityToBoughtBySUser * model.price;
    respons.pivotModel.quentityToBoughtBySpeceficUser = quentityToBoughtBySUser;

    return respons;
  }

  static int productTotal(int quentity, int price) {
    return quentity * price;
  }

  static TableRow makeTableRow(ProductModel productModel, double quentity) {
    double total = 0;
    int freeProduct = 0;
    //////// need edit /////
    /*if (((quentity - 1) % productModel.sale) == 0) {
      total = (quentity - 1) * productModel.price.toDouble();
      freeProduct =
          (((quentity - 1) % productModel.sale) * productModel.addSale).toInt();
    }
    if ((quentity - 1) % productModel.sale != 0 &&
        (quentity - 1) / productModel.sale < 1) {
      total = (productModel.price) * (quentity - 1) -
          (productModel.addSale * productModel.price) *
              ((quentity - 1) / productModel.sale);
      freeProduct = 0;
    }
    if (quentity % productModel.sale != 0 &&
        (quentity - 1) / productModel.sale > 1) {
      total = (productModel.price) * (quentity - 1) -
          (productModel.addSale * productModel.price) *
              ((quentity - 1) / productModel.sale);
      freeProduct = ((quentity - 1) / productModel.sale).toInt();
    }*/
    total = quentity * productModel.price;

    return TableRow(
      children: [
        Text(
          total.toInt().toString(),
          textAlign: TextAlign.center,
        ),
        Text(productModel.price.toString(), textAlign: TextAlign.center),
        Text(freeProduct.toString(), textAlign: TextAlign.center),
        Text((quentity).toString(), textAlign: TextAlign.center),
        Text(productModel.name, textAlign: TextAlign.center),
      ],
    );
  }

  static TableRow makeTableRowForHossa(
      ProductModel productModel, double quentity) {
    double total = productModel.price * (quentity);

    return TableRow(
      children: [
        Text(
          total.toInt().toString(),
          textAlign: TextAlign.center,
        ),
        Text(productModel.price.toString(), textAlign: TextAlign.center),
        Text('0', textAlign: TextAlign.center),
        Text((quentity).toString(), textAlign: TextAlign.center),
        Text(productModel.name, textAlign: TextAlign.center),
      ],
    );
  }

  // needs edit calcSafi
  int addFree(int quantity, int sale, int addsale) =>
      (quantity ~/ sale * addsale);
  double discount(int sale, int addsale, int price) =>
      ((sale * price) / (sale + addsale));
  void calcSafi(int quantity, int sale, int addsale, int price, items) {
    addFree(quantity, sale, addsale);
    for (int i = 0; i < quantity % sale; i++) {
      items[i].price = discount(sale, addsale, price);
    }
  }
}
