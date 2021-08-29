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
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Center(child: Text('لا يوجد معلومات'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Center(
                                  child: Text(
                                    snapshot.data[index].price.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Center(
                                  child: Text(
                                    snapshot.data[index].addSale.toString() +
                                        ' + ' +
                                        snapshot.data[index].sale.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Center(
                                  child: Text(
                                    snapshot.data[index].name,
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Center(
                                  child: Text(
                                    index.toString(),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                  ),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      );
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('لا يوجد اتصال بالانترنت'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
