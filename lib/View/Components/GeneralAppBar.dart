import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasShoppingCart;
  const GeneralAppBar({Key key, this.title, this.hasShoppingCart = true})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xffffb52d),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: (hasShoppingCart)
          ? <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ShoppingCart.id);
                },
              ),
            ]
          : [],
    );
  }
}
