import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/Services/Services.dart';
import 'package:pharma/View/Components/BasketTable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/BasketsController.dart';
import 'package:pharma/models/BasketModel.dart';
import 'package:provider/provider.dart';

class BasketResults extends StatelessWidget {
  static const String id = 'BasketPage';
  final BasketsModel basketsModel;
  BasketResults({Key key, this.basketsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasketsController basketsController = new BasketsController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'العرض',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              child: BasketTable(
                basketModel: this.basketsModel,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 6,
              child: Center(
                child: Text(
                  this.basketsModel.note,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: MediaQuery.of(context).size.width / 20,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Color(0xffffb52d),
              child: TextButton(
                onPressed: () async {
                  await basketsController
                      .buyBasket(Services.makeBasketModelToBuy(
                          basketsModel.sallatProducts[0].sallatId))
                      .then(
                    (result) {
                      Provider.of<Cart>(context, listen: false).basketRespons =
                          result;
                    },
                  );

                  if (Provider.of<Cart>(context, listen: false)
                          .basketRespons
                          .compareTo('تم الشراء بنجاح') ==
                      0) {
                    showSnackBar(
                        Provider.of<Cart>(context, listen: false)
                            .basketRespons
                            .toString(),
                        context);

                    Navigator.of(context).pushReplacementNamed(HomePage.id);

                    return;
                  }

                  showSnackBar(
                      Provider.of<Cart>(context, listen: false)
                          .basketRespons
                          .toString(),
                      context);

                  return;

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
    );
  }
}
