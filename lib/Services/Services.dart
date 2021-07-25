import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma/models/BillModel.dart';
import 'package:pharma/models/PivoitModal.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:pharma/models/BasketsModel.dart';
import 'package:pharma/models/BillProductModel.dart';

class Services {
  static BasketsModel makeBasketModelToBuy(int userId, int sallatId) {
    BasketsModel respons = BasketsModel();
    respons.userId = userId;
    respons.id = sallatId;
    return respons;
  }

  static BillModel makeBillModel(
      List<BillProductModel> list, int id, int fullTotal) {
    BillModel respons = BillModel();
    respons.UserId = 6;
    respons.fullTotal = fullTotal;
    respons.products = [];
    for (int i = 0; i < list.length; i++) {
      respons.products.add(list[i]);
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
    respons.createdAt = model.createdAt;
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
/////// need edit /////
    if ((quentity % productModel.sale) == 0) {
      total = quentity * productModel.price.toDouble();
      freeProduct =
          ((quentity % productModel.sale) * productModel.addSale).toInt();
    }
    if (quentity % productModel.sale != 0 && quentity / productModel.sale < 1) {
      total = (productModel.price) * (quentity) -
          (productModel.addSale * productModel.price) *
              (quentity / productModel.sale);
      freeProduct = 0;
    }
    if (quentity % productModel.sale != 0 && quentity / productModel.sale > 1) {
      total = (productModel.price) * (quentity) -
          (productModel.addSale * productModel.price) *
              (quentity / productModel.sale);
      freeProduct = (quentity / productModel.sale).toInt();
    }

    return TableRow(
      children: [
        Text(
          total.toInt().toString(),
          textAlign: TextAlign.center,
        ),
        Text(productModel.price.toString(), textAlign: TextAlign.center),
        Text(freeProduct.toString(), textAlign: TextAlign.center),
        Text((quentity - 1).toString(), textAlign: TextAlign.center),
        Text(productModel.name, textAlign: TextAlign.center),
      ],
    );
  }
}
