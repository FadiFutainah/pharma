import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatefulWidget {
  final String productName;
  final String companyName;
  const SearchResults({Key key, this.productName, this.companyName})
      : super(key: key);
  static const String id = 'SearchResults';

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int counter = 0;

  int _controller = 0;

  int maxVal = 1;

  ProductController productController = new ProductController();

  Future<ProductModel> futureProducts;
  bool isAdmin;
  @override
  void initState() {
    super.initState();
    futureProducts = productController.getProductByName(widget.productName);
  }

  @override
  Widget build(BuildContext context) {
    isAdmin =
        (Provider.of<AuthProvider>(context, listen: false).role == 'moder');
    return Scaffold(
      appBar: GeneralAppBar(
        title: 'نتائج البحث',
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width / 6.5,
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(
                    'شراء',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width / 6.5,
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(
                    'الكمية',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(
                    'السعر',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 42,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width * 0.22,
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(
                    'العرض',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height / 9,
                child: Center(
                  child: Text(
                    'اسم الصنف',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 28),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<ProductModel>(
            future: futureProducts,
            builder: (context, snapshot) {
              int maxVal = 0;
              if (snapshot.data.maxHossaModify != 0 &&
                  snapshot.data.maxHossaModify != null) {
                maxVal = snapshot.data.maxHossaModify;
              }
              if (snapshot.hasData) {
                if (snapshot.data.name == 'not found') {
                  return Center(child: Text('لا يوجد نتائج بحث'));
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                ),
                                onPressed: () {
                                  if (!isAdmin) {
                                    if (snapshot.data.maxHossaModify == 0) {
                                      showSnackBar(
                                        'لا يمكنك الإضافة .. ليس لديك حصة من هذا المنتج',
                                        context,
                                      );
                                      return;
                                    }

                                    if (_controller == 0) {
                                      showSnackBar(
                                        'يرجى وضع الكمية المطلوبة',
                                        context,
                                      );
                                      return;
                                    }

                                    Provider.of<Cart>(context, listen: false)
                                        .addItem(snapshot.data, _controller);
                                    showSnackBar(
                                      'يرجى وضع الكمية المطلوبة',
                                      context,
                                    );
                                  } else {
                                    showSnackBar('لا يمكنك الشراء', context);
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            height: MediaQuery.of(context).size.height / 9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Card(
                                color: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Center(
                                    child: NumberPicker(
                                      textStyle: TextStyle(color: Colors.white),
                                      value: _controller,
                                      minValue: 0,
                                      selectedTextStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              34,
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
                          Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Center(
                              child: Text(
                                snapshot.data.price.toString(),
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height / 42,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Center(
                              child: (snapshot.data.sale != null &&
                                      snapshot.data.sale != 0)
                                  ? Text(
                                      snapshot.data.sale.toString() +
                                          ' + ' +
                                          snapshot.data.addSale.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                26,
                                      ),
                                    )
                                  : Text(''),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height / 9,
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
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
