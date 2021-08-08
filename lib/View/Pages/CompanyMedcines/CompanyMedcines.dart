import 'package:pharma/View/Components/barGanaral.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharma/Providers/CartProvider.dart';

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

  bool active = false;

  @override
  void initState() {
    super.initState();

    /////// user Id //////
    futureProducts = productController.getByCompanyId(widget.companyId, 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarGeneral(
        title: widget.companyName,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return Center(child: Text('لا يوجد منتجات'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  int item = 0;
                  _controllers.add(item);
                  int maxVal = 1;
                  if (snapshot.data[index].maxHossaModify != 0) {
                    maxVal = snapshot.data[index].maxHossaModify;
                  }

                  return Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: Center(
                                        child: Text(
                                          snapshot.data[index].price.toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      )),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                  ),
                                  onPressed: () {
                                    if (snapshot.data[index].maxHossaModify ==
                                        0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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

                                    if (_controllers[index] == 0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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

                                    print(snapshot.data[index].price /
                                        snapshot.data[index].sale);
                                    print('object done');
                                    Provider.of<Cart>(context, listen: false)
                                        .addItem(snapshot.data[index],
                                            _controllers[index]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'تم إضافة المنتج إلى الفاتورة',
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    print('object done');
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
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  child: Card(
                                    color: Theme.of(context).primaryColor,
                                    child: Center(
                                      child: NumberPicker(
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        value: _controllers[index],
                                        minValue: 0,
                                        selectedTextStyle: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                        maxValue: maxVal,
                                        itemCount: 1,
                                        zeroPad: false,
                                        onChanged: (value) => setState(
                                            () => _controllers[index] = value),
                                      ),
                                    ),
                                  ),
                                ),
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
                                        MediaQuery.of(context).size.height / 35,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  );
                },
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
