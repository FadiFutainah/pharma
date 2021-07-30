import 'package:pharma/Providers/Services.dart';
import 'package:pharma/View/Components/BasketTable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/controllers/BasketsController.dart';
import 'package:pharma/models/BasketsModel.dart';

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
                onPressed: () {
                  basketsController.buyBasket(Services.makeBasketModelToBuy(
                      1, basketsModel.sallatProducts[0].sallatId));
                  Navigator.pushNamed(context, HomePage.id);

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
