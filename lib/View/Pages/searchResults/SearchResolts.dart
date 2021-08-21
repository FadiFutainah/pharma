import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/View/Components/barGanaral.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/ProductModel.dart';
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

  int _controller = 0;

  int maxVal = 1;

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
      appBar: BarGeneral(
        title: 'نتائج البحث',
      ),
      body: FutureBuilder<ProductModel>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.name == 'not found') {
              return Center(child: Text('لا يوجد نتائج بحث'));
            } else {
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                        onPressed: () {
                          if (snapshot.data.maxHossaModify == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'لا يمكنك الإضافة .. ليس لديك حصة من هذا المنتج',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 4),
                              ),
                            );
                            return;
                          }

                          if (_controller == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'يرجى وضع الكمية المطلوبة',
                                  textAlign: TextAlign.center,
                                ),
                                duration: Duration(seconds: 4),
                              ),
                            );
                            return;
                          }

                          Provider.of<Cart>(context, listen: false)
                              .addItem(snapshot.data, _controller);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'تم إضافة المنتج إلى الفاتورة',
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Center(
                              child: NumberPicker(
                                textStyle: TextStyle(color: Colors.white),
                                value: _controller,
                                minValue: 0,
                                selectedTextStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 34,
                                    color: Colors.white),
                                maxValue: maxVal,
                                itemCount: 1,
                                zeroPad: false,
                                onChanged: (value) =>
                                    setState(() => _controller = value),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        child: Center(
                          child: Text(
                            snapshot.data.price.toString(),
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 42,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.5,
                        child: Center(
                          child: Text(
                            snapshot.data.sale.toString() +
                                ' + ' +
                                snapshot.data.addSale.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Center(
                          child: Text(
                            snapshot.data.name.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 23),
                          ),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
