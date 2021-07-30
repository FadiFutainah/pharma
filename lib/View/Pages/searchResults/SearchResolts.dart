import 'package:flutter/material.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/searchResults/bar.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class SearchResolts extends StatefulWidget {
  final String productName;
  final String companyName;
  const SearchResolts({Key key, this.productName, this.companyName})
      : super(key: key);
  static const String id = 'searchResolts';

  @override
  _SearchResoltsState createState() => _SearchResoltsState();
}

class _SearchResoltsState extends State<SearchResolts> {
  int counter = 0;

  int _controller = 1;

  ProductController productController = new ProductController();

  Future<ProductModel> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = productController.getProductByName(widget.productName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar(),
        body: FutureBuilder<ProductModel>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.name == 'not found') {
                  return Center(child: Text('لا يوجد نتائج بحث'));
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
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
                                      print('object done');
                                      Provider.of<Cart>(context, listen: false)
                                          .addItem(snapshot.data, _controller);
                                      print('object done');
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data.addSale.toString() +
                                          ' + ' +
                                          snapshot.data.sale.toString(),
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
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Card(
                                          color: Theme.of(context).primaryColor,
                                          child: NumberPicker(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            value: _controller,
                                            minValue: 1,
                                            maxValue: 1000,
                                            zeroPad: false,
                                            onChanged: (value) => setState(
                                                () => _controller = value),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            child: Text(
                              snapshot.data.name,
                              textDirection: TextDirection.rtl,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 35,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('لا يوجد اتصال بالانترنت'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
