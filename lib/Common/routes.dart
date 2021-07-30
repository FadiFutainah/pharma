import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/Admin/AddBasketPage.dart';
import 'package:pharma/View/Pages/Admin/AddCompanyPage.dart';
import 'package:pharma/View/Pages/Admin/AddProductPage.dart';
import 'package:pharma/View/Pages/Admin/AddUserPage.dart';
import 'package:pharma/View/Pages/Admin/SignedUsersPage.dart';
import 'package:pharma/View/Pages/BasketResult/BasketResult.dart';
import 'package:pharma/View/Pages/Bills/Bills.dart';
import 'package:pharma/View/Pages/Cart/ShoppingCart.dart';
import 'package:pharma/View/Pages/CompanyMedcines/CompanyMedcines.dart';
import 'package:pharma/View/Pages/Contact-us/ContactUsPage.dart';
import 'package:pharma/View/Pages/Contact-us/SuggestionsPage.dart';
import 'package:pharma/View/Pages/Home/AdminHomePage.dart';
import 'package:pharma/View/Pages/Home/HomePage.dart';
import 'package:pharma/View/Pages/MostWantedProduct/MostWantedProducts.dart';
import 'package:pharma/View/Pages/Myinfo/MyInfo.dart';
import 'package:pharma/View/Pages/Scedual/AdminSchedualPage.dart';
import 'package:pharma/View/Pages/Scedual/SchedualPage.dart';
import 'package:pharma/View/Pages/WelcomePage.dart';
import 'package:pharma/View/Pages/companies/Companies.dart';
import 'package:pharma/View/Pages/searchResults/SearchResolts.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';
import 'package:pharma/View/Pages/signUp/SignUp.dart';
import 'package:pharma/View/Pages/temp/Temp.dart';

final Map<String, WidgetBuilder> routes = {
  ContactUsPage.id: (context) => ContactUsPage(),
  TempPage.id: (context) => TempPage(),
  HomePage.id: (context) => HomePage(),
  SignIn.id: (context) => SignIn(),
  SignUp.id: (context) => SignUp(),
  Companies.id: (context) => Companies(),
  CompanyMedcines.id: (context) => CompanyMedcines(),
  WelcomePage.id: (context) => WelcomePage(),
  MyInfo.id: (context) => MyInfo(),
  Bills.id: (context) => Bills(),
  ShoppingCart.id: (context) => ShoppingCart(),
  SearchResolts.id: (context) => SearchResolts(),
  MostWanted.id: (context) => MostWanted(),
  BasketResults.id: (context) => BasketResults(),
  AddBasketPage.id: (context) => AddBasketPage(),
  AddCompanyPage.id: (context) => AddCompanyPage(),
  AddProductPage.id: (context) => AddProductPage(),
  AddUserPage.id: (context) => AddUserPage(),
  AdminHomePage.id: (context) => AdminHomePage(),
  SuggestionsPage.id: (context) => SuggestionsPage(),
  SchedualPage.id: (context) => SchedualPage(),
  AdminSchedualPage.id: (context) => AdminHomePage(),
  SignedUsersPage.id: (context) => SignedUsersPage(),
};
