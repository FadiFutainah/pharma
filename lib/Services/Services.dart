import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma/models/BasketModel.dart';
import 'package:pharma/models/BillModel.dart';
import 'package:pharma/models/BillProductModel.dart';
import 'package:pharma/models/HossaProductModel.dart';
import 'package:pharma/models/PivoitModal.dart';
import 'package:pharma/models/ProductModel.dart';

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
    respons.userId = 1;
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

  static TableRow makeTableRow(ProductModel productModel, double quantity) {
    //////// need edit /////
    int freeProduct = 0;

    if (quantity >= productModel.sale) {
      freeProduct = quantity ~/ productModel.sale * productModel.addSale;
    }

    double safi = (quantity % productModel.sale == 0)
        ? productModel.price.toDouble()
        : ((productModel.sale * productModel.price) /
                (productModel.sale + productModel.addSale))
            .toDouble();
    double total = quantity % productModel.sale * safi +
        (quantity - (quantity % productModel.sale)) * productModel.price;

    return TableRow(
      children: [
        Text(
          total.toInt().toString(),
          textAlign: TextAlign.center,
          /*style: TextStyle(fontSize: 25),*/
        ),
        Text(
          safi.toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          freeProduct.toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          quantity.toInt().toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          productModel.name,
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
      ],
    );
  }

  static TableRow makeTableRowForHossa(
      ProductModel productModel, double quantity) {
    int freeProduct = quantity ~/ productModel.sale * productModel.addSale;
    double safi = (quantity % productModel.sale == 0)
        ? productModel.price.toDouble()
        : ((productModel.sale * productModel.price) /
                (productModel.sale + productModel.addSale))
            .toDouble();
    double total = quantity % productModel.sale * safi +
        (quantity - (quantity % productModel.sale)) * productModel.price;

    return TableRow(
      children: [
        Text(
          total.toInt().toString(),
          textAlign: TextAlign.center,
          /*style: TextStyle(fontSize: 25),*/
        ),
        Text(
          safi.toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          freeProduct.toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          quantity.toString(),
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
        Text(
          productModel.name,
          textAlign: TextAlign.center, /*style: TextStyle(fontSize: 25)*/
        ),
      ],
    );
  }
}
