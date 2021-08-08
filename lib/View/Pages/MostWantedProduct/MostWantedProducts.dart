import 'package:pharma/Controllers/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Components/barGanaral.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
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
        appBar: BarGeneral(
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
                              IconButton(
                                icon: Icon(
                                  Icons.info_outline_rounded,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(HomePage.id);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data[index].addSale.toString() +
                                      ' + ' +
                                      snapshot.data[index].sale.toString(),
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    snapshot.data[index].name,
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              35,
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
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('لا يوجد اتصال بالانترنت'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
