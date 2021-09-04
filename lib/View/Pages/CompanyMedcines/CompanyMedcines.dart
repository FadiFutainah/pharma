import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/AuthProvider.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/HossaProductModel.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:provider/provider.dart';

class CompanyMedcines extends StatefulWidget {
  final companyId;
  final String companyName;
  CompanyMedcines({this.companyName, this.companyId});
  static const String id = 'companyMedcines';

  @override
  _CompanyMedcinesState createState() => _CompanyMedcinesState();
}

class _CompanyMedcinesState extends State<CompanyMedcines> {
  List<int> _controllers = [];

  ProductController productController = new ProductController();

  Future<List<ProductModel>> futureProducts;

  bool active = false;
  bool isAdmin;
  @override
  void initState() {
    super.initState();
    futureProducts = productController.getByCompanyId(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    isAdmin =
        (Provider.of<AuthProvider>(context, listen: false).role == 'moder');
    return Scaffold(
      appBar: GeneralAppBar(
        title: widget.companyName,
        hasShoppingCart: !isAdmin,
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
          FutureBuilder<List<ProductModel>>(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Center(child: Text('لا يوجد منتجات'));
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        int item = 0;
                        _controllers.add(item);
                        int maxVal = 0;
                        if (snapshot.data[index].maxHossaModify != 0 &&
                            snapshot.data[index].maxHossaModify != null) {
                          maxVal = snapshot.data[index].maxHossaModify;
                        }

                        return Container(
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey)),
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
                                        if (snapshot
                                                .data[index].maxHossaModify ==
                                            0) {
                                          showSnackBar(
                                            'لا يمكنك الإضافة .. ليس لديك حصة من هذا المنتج',
                                            context,
                                          );
                                          return;
                                        }

                                        if (_controllers[index] == 0) {
                                          showSnackBar(
                                            'يرجى وضع الكمية المطلوبة',
                                            context,
                                          );
                                          return;
                                        }

                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .addItem(snapshot.data[index],
                                                _controllers[index]);
                                        showSnackBar(
                                          'يرجى وضع الكمية المطلوبة',
                                          context,
                                        );
                                      } else {
                                        showSnackBar(
                                            'لا يمكنك الشراء', context);
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
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          value: _controllers[index],
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
                                          onChanged: (value) => setState(() =>
                                              _controllers[index] = value),
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
                                    snapshot.data[index].price.toString(),
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              42,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: MediaQuery.of(context).size.height / 9,
                                child: Center(
                                  child: (snapshot.data[index].sale != null &&
                                          snapshot.data[index].sale != 0)
                                      ? Text(
                                          snapshot.data[index].sale.toString() +
                                              ' + ' +
                                              snapshot.data[index].addSale
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                    snapshot.data[index].name.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                23),
                                  ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
