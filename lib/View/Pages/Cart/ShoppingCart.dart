import 'package:pharma/controllers/BillController.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/Services/Services.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  static const String id = '/cart';
  const ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BillController billController = new BillController();
    final List<TableRow> products = Provider.of<Cart>(context).items;
    final List<ProductModel> editableList =
        Provider.of<Cart>(context, listen: false).product;
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
        /*actions: [
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.check,
              ),
              onPressed: () { 
               billController.addBill(Services.makeBillModel
               (Provider.of<Cart>(context,listen: false).products, 6, 600)); 


                Provider.of<Cart>(context,listen: false).removeAll();
                ///Provider.of<Cart>(context,listen: false).removeAllProducts();

              },
            ),
          ],*/
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffb52d),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                height: 20,
                child: Dialog(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: editableList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                editableList.removeAt(index);
                                Provider.of<Cart>(context, listen: false)
                                    .deleteItemFromCart(editableList[index]);

                                //editableProducts.removeAt(index);
                              },
                            ),
                            Text(
                                Provider.of<Cart>(context).product[index].name),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
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
                          Text('صافي الفاتورة', textAlign: TextAlign.center),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            Provider.of<Cart>(context, listen: true)
                                .total()
                                .toString(),
                            textAlign: TextAlign.center,
                          ),
                          Text('', textAlign: TextAlign.center),
                          Text('الرصيد الاجمالي', textAlign: TextAlign.center),
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
                    onPressed: () {
                      if (Provider.of<Cart>(context, listen: false)
                          .items
                          .isEmpty) {
                        return;
                      } else {
                        // needs edit user id

                        billController.addBill(Services.makeBillModel(
                            Provider.of<Cart>(context, listen: false).products,
                            1,
                            Provider.of<Cart>(context, listen: false)
                                .total()
                                .toInt()));
                        Provider.of<Cart>(context, listen: false).removeAll();
                      }

                      ///Provider.of<Cart>(context,listen: false).removeAllProducts();
                    },
                    child: Text(
                      'شراء',
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
  }
}





/*ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(products[index].name),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart_outlined),
            onPressed: () => Provider.of<Cart>(context, listen: false)
                .removeItem(products[index]),
          ),
        ),
      ),*/
