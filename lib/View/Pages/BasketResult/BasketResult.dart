import 'package:pharma/Providers/CartProvider.dart';
import 'package:pharma/Services/Services.dart';
import 'package:pharma/View/Components/BasketTable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/BasketsController.dart';
import 'package:pharma/models/BasketsModel.dart';
import 'package:provider/provider.dart';

class BasketResults extends StatelessWidget {
  static const String id = '/BasketModel';
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
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Color(0xffffb52d),
              child: TextButton(
                onPressed: () async {
                  await basketsController
                      .buyBasket(Services.makeBasketModelToBuy(
                          1, basketsModel.sallatProducts[0].sallatId))
                      .then((result) {
                    Provider.of<Cart>(context, listen: false).basketRespons =
                        result;
                  });

                  if (Provider.of<Cart>(context, listen: false)
                          .basketRespons
                          .compareTo('تم الشراء بنجاح') ==
                      0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          Provider.of<Cart>(context, listen: false)
                              .basketRespons
                              .toString(),
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(seconds: 4),
                      ),
                    );

                    Navigator.of(context).pushReplacementNamed(HomePage.id);

                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        Provider.of<Cart>(context, listen: false)
                            .basketRespons
                            .toString(),
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(seconds: 4),
                    ),
                  );

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
