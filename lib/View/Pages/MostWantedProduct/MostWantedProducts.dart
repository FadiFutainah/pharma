import 'package:pharma/Controllers/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/models/ProductModel.dart';

class MostWanted extends StatefulWidget {
  const MostWanted({Key key}) : super(key: key);
  static const String id = 'mostWanted';

  @override
  _MostWantedState createState() => _MostWantedState();
}

class _MostWantedState extends State<MostWanted> {
  ProductController productController = new ProductController();

  Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = productController.getMostWantedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: 'الأكثر طلباً',
        hasShoppingCart: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(color: Colors.black),
                    horizontal: BorderSide(color: Colors.grey),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 5,
                child: Center(
                  child: Text(
                    'السعر'.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 3.35,
                child: Center(
                  child: Text(
                    'العرض'.toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(color: Colors.black),
                    horizontal: BorderSide(color: Colors.grey),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: Text(
                    'الاسم',
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 20,
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          FutureBuilder<List<ProductModel>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Center(child: Text('لا يوجد معلومات'));
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      vertical: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Center(
                                    child: (snapshot.data[index].sale != null &&
                                            snapshot.data[index].sale != 0)
                                        ? Text(
                                            snapshot.data[index].addSale
                                                    .toString() +
                                                ' + ' +
                                                snapshot.data[index].sale
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20),
                                          )
                                        : Text(''),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      vertical: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Center(
                                    child: Text(
                                      snapshot.data[index].name,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('لا يوجد اتصال بالانترنت'));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
