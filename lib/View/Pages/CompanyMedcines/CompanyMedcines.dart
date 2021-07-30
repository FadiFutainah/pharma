import 'package:numberpicker/numberpicker.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyMedcines extends StatefulWidget {
  final companyId;
  final String companyName;
  const CompanyMedcines({Key key, this.companyName, this.companyId})
      : super(key: key);
  static const String id = 'companyMedcines';

  @override
  _CompanyMedcinesState createState() => _CompanyMedcinesState();
}

class _CompanyMedcinesState extends State<CompanyMedcines> {
  List<int> _controllers = [];

  ProductController productController = new ProductController();

  Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = productController.getByCompanyId(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xffffb52d),
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.companyName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(ShoppingCart.id);
              },
            ),
          ],
        ),
        // drawer: Container(
        //     width: MediaQuery.of(context).size.width / 1.7,
        //     child: MainpageDrawer(
        //       userName: 'احمد',
        //       pharmacyName: 'الصيدلية المركزية',
        //     )),
        body: FutureBuilder<List<ProductModel>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      int item = 1;
                      _controllers.add(item);

                      return Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.info_outline_rounded,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(HomePage.id);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.shopping_cart_outlined,
                                        ),
                                        onPressed: () {
                                          print(snapshot.data[index].price /
                                              snapshot.data[index].sale);
                                          print('object done');
                                          Provider.of<Cart>(context,
                                                  listen: false)
                                              .addItem(snapshot.data[index],
                                                  _controllers[index]);
                                          /*.addItem(Services.makeTableRow(
                                                  snapshot.data[index],
                                                  _controllers[index]
                                                      .toDouble()));
                                          Provider.of<Cart>(context,
                                                  listen: false)
                                              .addProduct(Services.convertProductToBillProduct(snapshot.data[index],
                                               _controllers[index]));*/
                                          print('object done');
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data[index].addSale
                                                  .toString() +
                                              ' + ' +
                                              snapshot.data[index].sale
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  35),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: Card(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              child: NumberPicker(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                value: _controllers[index],
                                                minValue: 0,
                                                maxValue: 1000,
                                                zeroPad: false,
                                                onChanged: (value) => setState(
                                                    () => _controllers[index] =
                                                        value),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('لا يوجد اتصال بالانترنت'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
