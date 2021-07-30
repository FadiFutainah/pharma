import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:pharma/View/Pages/searchResults/SearchResolts.dart';
import 'package:pharma/controllers/ProductController.dart';
import 'package:pharma/models/ProductModel.dart';
import 'package:textfield_search/textfield_search.dart';

class SearchField extends StatefulWidget {
  ///const SearchFiled({ Key? key }) : super(key: key);

  @override
  _SearchFiledState createState() => _SearchFiledState();
}

class _SearchFiledState extends State<SearchField> {
  TextEditingController textEditingController = new TextEditingController();

  ProductController productController = new ProductController();

  Future<List> futureProductsNames;
  List<ProductModel> allProductsList = [];
  @override
  void initState() {
    super.initState();
    futureProductsNames = productController.getProductsName();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 55),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFieldSearch(
            label: 'search',
            controller: textEditingController,
            future: () {
              return futureProductsNames;
            },
            minStringLength: 0,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    if (textEditingController.text == '') {
                      return;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResolts(
                              productName: textEditingController.text,
                            ),
                          ));
                    }
                  }),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              hintStyle: TextStyle(
                package: 'google_fonts_arabic',
                fontFamily: ArabicFonts.Cairo,
              ),
              hintText: 'البحث',
              alignLabelWithHint: true,
              hintTextDirection: TextDirection.rtl,
            ),
            // ----------------------------------//
            // autofillHints: ,
            //------------------------------------//
            /*cursorColor: Colors.grey,
            textAlign: TextAlign.right,*/
          ),
        ),
      ),
    );
  }
}
