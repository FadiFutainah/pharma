import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma/models/BasketModel.dart';
import 'package:pharma/models/BillModel.dart';
import 'package:pharma/models/BillProductModel.dart';
import 'package:pharma/models/BillSallatModel.dart';
import 'package:pharma/models/HossaProductModel.dart';
import 'package:pharma/models/PivoitModal.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:pharma/models/SallatProducts.dart';

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

  static BasketsModel makeBasketModelToBuy(int sallatId) {
    BasketsModel respons = BasketsModel();
    respons.id = sallatId;
    return respons;
  }

  static BillModel makeBillModel(listProduct, listHossa, int fullTotal) {
    for (int i = 0; i < listHossa.length; i++) {
      listProduct.add(listHossa[i]);
    }

    BillModel respons = BillModel();
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
    double total = 0;
    double safi = productModel.price.toDouble();
    if (productModel.sale != 0 && productModel.addSale != 0) {
      if (quantity % productModel.sale == 0) {
        freeProduct = quantity ~/ productModel.sale * productModel.addSale;
      } else {
        freeProduct = 0;
        safi = ((productModel.sale * productModel.price) /
                (productModel.sale + productModel.addSale))
            .toDouble();
        total = quantity % productModel.sale * safi +
            (quantity - (quantity % productModel.sale)) * productModel.price;
      }
    } else {
      total = quantity % productModel.sale +
          (quantity - (quantity % productModel.sale)) * productModel.price;
    }

    return TableRow(
      children: [
        Text(
          total.ceil().toString(),
          textAlign: TextAlign.center,
          /*style: TextStyle(fontSize: 25),*/
        ),
        Text(
          safi.ceil().toString(),
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

  ////// bills services to get //////

  static List<BillProductModel> convertListOfSallatProductToListOfBillProduct(
      List<SallatProducts> list) {
    List<BillProductModel> billProductModel = [];
    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        BillProductModel bb = BillProductModel();
        bb.id = list[i].id;
        bb.name = list[i].productsName;
        bb.price = list[i].price;
        bb.sale = list[i].sale;
        bb.addSale = list[i].addSale;
        PivotModel pivotModel = PivotModel();
        pivotModel.total = list[i].total;
        pivotModel.quentityToBoughtBySpeceficUser = list[i].quentity;
        bb.pivotModel = pivotModel;
        billProductModel.add(bb);
      }
    }
    return billProductModel;
  }

  static BillModel convertBillSallatModelToBillModel(BillSallatModel b) {
    BillModel billModel = BillModel();
    billModel.id = b.id;
    billModel.createdAt = b.createdAt;
    billModel.fullTotal = b.sallat.fullTotal;
    billModel.products = Services.convertListOfSallatProductToListOfBillProduct(
        b.sallat.sallatProducts);
    return billModel;
  }

  static List<BillModel> convartListOfBasketModelToListOfBillModel(
      List<BillSallatModel> list) {
    List<BillModel> billModel = [];
    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        billModel.add(Services.convertBillSallatModelToBillModel(list[i]));
      }
    }

    return billModel;
  }

  static List<BillModel> convertToListOfBillModel(
      List<BillModel> billModel, List<BillSallatModel> billSallatModel) {
    List<BillModel> response = [];
    if (billModel != null && billSallatModel != null) {
      for (int i = 0; i < billModel.length; i++) {
        response.add(billModel[i]);
      }
      for (int i = 0; i < billSallatModel.length; i++) {
        response.add(
            Services.convertBillSallatModelToBillModel(billSallatModel[i]));
      }
    }

    return response;
  }

  static TableRow makeTableRowForHossa(
      ProductModel productModel, double quantity) {
    int freeProduct = 0;
    double total = 0;
    double safi = productModel.price.toDouble();
    if (productModel.sale != 0 && productModel.addSale != 0) {
      if (quantity % productModel.sale == 0) {
        freeProduct = quantity ~/ productModel.sale * productModel.addSale;
      } else {
        freeProduct = 0;
        safi = ((productModel.sale * productModel.price) /
                (productModel.sale + productModel.addSale))
            .toDouble();
        total = quantity % productModel.sale * safi +
            (quantity - (quantity % productModel.sale)) * productModel.price;
      }
    } else {
      total = quantity % productModel.sale +
          (quantity - (quantity % productModel.sale)) * productModel.price;
    }

    return TableRow(
      children: [
        Text(
          total.ceil().toString(),
          textAlign: TextAlign.center,
          /*style: TextStyle(fontSize: 25),*/
        ),
        Text(
          safi.ceil().toString(),
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
}
