import 'package:pharma/Services/Services.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/BillController.dart';
import 'package:flutter/material.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  static const String id = '/cart';

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    BillController billController = new BillController();
    final List<TableRow> products = Provider.of<Cart>(context).productitems;
    final List<TableRow> hossa = Provider.of<Cart>(context).hossaitems;

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'الفاتورة',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        child: Table(
                          columnWidths: {
                            1: FixedColumnWidth(
                                MediaQuery.of(context).size.width * 0.15),
                            4: FixedColumnWidth(
                                MediaQuery.of(context).size.width * 0.3),
                          },
                          border: TableBorder(
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            horizontalInside: BorderSide(color: Colors.black),
                            verticalInside: BorderSide(color: Colors.black),
                          ),
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  'الاجمالي',
                                  textAlign: TextAlign.center,
                                ),
                                Text('السعر', textAlign: TextAlign.center),
                                Text('المجاني', textAlign: TextAlign.center),
                                Text('الكمية', textAlign: TextAlign.center),
                                Text('الصنف', textAlign: TextAlign.center),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (context, index) => Container(
                          child: Table(
                            columnWidths: {
                              1: FixedColumnWidth(
                                  MediaQuery.of(context).size.width * 0.15),
                              4: FixedColumnWidth(
                                  MediaQuery.of(context).size.width * 0.3),
                            },
                            border: TableBorder(
                              bottom: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              horizontalInside: BorderSide(color: Colors.black),
                              verticalInside: BorderSide(color: Colors.black),
                            ),
                            children: [
                              products[index],
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: hossa.length,
                        itemBuilder: (context, index) => Container(
                          child: Table(
                            columnWidths: {
                              1: FixedColumnWidth(
                                  MediaQuery.of(context).size.width * 0.15),
                              4: FixedColumnWidth(
                                  MediaQuery.of(context).size.width * 0.3),
                            },
                            border: TableBorder(
                              bottom: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              horizontalInside: BorderSide(color: Colors.black),
                              verticalInside: BorderSide(color: Colors.black),
                            ),
                            children: [
                              hossa[index],
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Container(
                        child: Table(
                          columnWidths: {
                            0: FixedColumnWidth(
                                MediaQuery.of(context).size.width / 3.145),
                            2: FixedColumnWidth(
                                MediaQuery.of(context).size.width / 3.33),
                          },
                          border: TableBorder(
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            horizontalInside: BorderSide(color: Colors.black),
                            verticalInside: BorderSide(color: Colors.black),
                          ),
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  '',
                                  textAlign: TextAlign.center,
                                ),
                                Text('', textAlign: TextAlign.center),
                                Text('صافي الفاتورة',
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  Provider.of<Cart>(context, listen: true)
                                      .total
                                      .toString(),
                                  textAlign: TextAlign.center,
                                ),
                                Text('', textAlign: TextAlign.center),
                                Text('الرصيد الاجمالي',
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Color(0xffffb52d),
                        child: TextButton(
                          onPressed: () async {
                            if (Provider.of<Cart>(context, listen: false)
                                .productitems
                                .isEmpty) {
                              return;
                            } else {
                              ///// user Id ///////
                              await billController
                                  .addBill(Services.makeBillModel(
                                      Provider.of<Cart>(context, listen: false)
                                          .billProducts,
                                      Provider.of<Cart>(context, listen: false)
                                          .billHossa,
                                      1,
                                      Provider.of<Cart>(context, listen: false)
                                          .total
                                          .toInt()))
                                  .then((String result) {
                                Provider.of<Cart>(context, listen: false)
                                    .billRespons = result;
                              });

                              if (Provider.of<Cart>(context, listen: false)
                                      .billRespons
                                      .compareTo('تم الشراء بنجاح') ==
                                  0) {
                                Navigator.of(context)
                                    .pushReplacementNamed(HomePage.id);

                                Provider.of<Cart>(context, listen: false)
                                    .removeAll();
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    Provider.of<Cart>(context, listen: false)
                                        .billRespons
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(seconds: 4),
                                ),
                              );
                            }

                            ///Provider.of<Cart>(context,listen: false).removeAllProducts();
                          },
                          child: Text(
                            'تثبيت',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          ////////////////////////////// on rotation ///////////////////////////////////////////////

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'الفاتورة',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.close,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.82,
                            child: Table(
                              columnWidths: {
                                1: FixedColumnWidth(
                                    MediaQuery.of(context).size.width * 0.15),
                                4: FixedColumnWidth(
                                    MediaQuery.of(context).size.width * 0.3),
                              },
                              border: TableBorder(
                                bottom: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                horizontalInside:
                                    BorderSide(color: Colors.black),
                                verticalInside: BorderSide(color: Colors.black),
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      'الاجمالي',
                                      textAlign: TextAlign.center,
                                      /*style: TextStyle(fontSize: 20)*/
                                    ),
                                    Text(
                                      'السعر',
                                      textAlign: TextAlign
                                          .center, /*style: TextStyle(fontSize: 20)*/
                                    ),
                                    Text(
                                      'المجاني',
                                      textAlign: TextAlign
                                          .center, /*style: TextStyle(fontSize: 20)*/
                                    ),
                                    Text(
                                      'الكمية',
                                      textAlign: TextAlign
                                          .center, /*style: TextStyle(fontSize: 20)*/
                                    ),
                                    Text(
                                      'الصنف',
                                      textAlign: TextAlign
                                          .center, /*style: TextStyle(fontSize: 20)*/
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.close,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (context, index) => Row(
                          ///mainAxisSize: MainAxisSize.max,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.close,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.82,
                              child: Table(
                                columnWidths: {
                                  1: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.15),
                                  4: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.3),
                                },
                                border: TableBorder(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  horizontalInside:
                                      BorderSide(color: Colors.black),
                                  verticalInside:
                                      BorderSide(color: Colors.black),
                                ),
                                children: [
                                  products[index],
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<Cart>(context, listen: false)
                                      .deleteItem(Provider.of<Cart>(context,
                                              listen: false)
                                          .product[index]);
                                },
                                child: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: hossa.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.close,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.82,
                              child: Table(
                                columnWidths: {
                                  1: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.15),
                                  4: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.3),
                                },
                                border: TableBorder(
                                  bottom: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  horizontalInside:
                                      BorderSide(color: Colors.black),
                                  verticalInside:
                                      BorderSide(color: Colors.black),
                                ),
                                children: [
                                  hossa[index],
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.close,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.close,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.82,
                            child: Table(
                              columnWidths: {
                                0: FixedColumnWidth(
                                    MediaQuery.of(context).size.width / 3.66),
                                2: FixedColumnWidth(
                                    MediaQuery.of(context).size.width / 3.33),
                              },
                              border: TableBorder(
                                bottom: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                horizontalInside:
                                    BorderSide(color: Colors.black),
                                verticalInside: BorderSide(color: Colors.black),
                              ),
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      '',
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('', textAlign: TextAlign.center),
                                    Text('صافي الفاتورة',
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Text(
                                      Provider.of<Cart>(context, listen: true)
                                          .total
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text('', textAlign: TextAlign.center),
                                    Text('الرصيد الاجمالي',
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.close,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          color: Color(0xffffb52d),
                          child: TextButton(
                            onPressed: () async {
                              if (Provider.of<Cart>(context, listen: false)
                                  .productitems
                                  .isEmpty) {
                                return;
                              } else {
                                ///// user Id ///////
                                await billController
                                    .addBill(Services.makeBillModel(
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .billProducts,
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .billHossa,
                                        1,
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .total
                                            .toInt()))
                                    .then((String result) {
                                  Provider.of<Cart>(context, listen: false)
                                      .billRespons = result;
                                });

                                if (Provider.of<Cart>(context, listen: false)
                                        .billRespons
                                        .compareTo('تم الشراء بنجاح') ==
                                    0) {
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomePage.id);

                                  Provider.of<Cart>(context, listen: false)
                                      .removeAll();
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      Provider.of<Cart>(context, listen: false)
                                          .billRespons
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    duration: Duration(seconds: 4),
                                  ),
                                );
                              }

                              ///Provider.of<Cart>(context,listen: false).removeAllProducts();
                            },
                            child: Text(
                              'تثبيت',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
