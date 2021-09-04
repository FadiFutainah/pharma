import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/About-us/AboutUs.dart';
import 'package:pharma/View/Pages/Admin/AddBasketPage.dart';
import 'package:pharma/View/Pages/Admin/AddCompanyPage.dart';
import 'package:pharma/View/Pages/Admin/AddNewAdminPage.dart';
import 'package:pharma/View/Pages/Admin/AddProductPage.dart';
import 'package:pharma/View/Pages/Admin/AddUserPage.dart';
import 'package:pharma/View/Pages/Admin/AdminsPage.dart';
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
import 'package:pharma/View/Pages/Scheduale/AdminSchedualPage.dart';
import 'package:pharma/View/Pages/Scheduale/SchedualPage.dart';
import 'package:pharma/View/Pages/WelcomePage.dart';
import 'package:pharma/View/Pages/companies/Companies.dart';
import 'package:pharma/View/Pages/searchResults/SearchResults.dart';
import 'package:pharma/View/Pages/signIn/SignIn.dart';
import 'package:pharma/View/Pages/signUp/SignUp.dart';

final Map<String, WidgetBuilder> routes = {
  Bills.id: (context) => Bills(),
  SignIn.id: (context) => SignIn(),
  SignUp.id: (context) => SignUp(),
  HomePage.id: (context) => HomePage(),
  Companies.id: (context) => Companies(),
  MostWanted.id: (context) => MostWanted(),
  AdminsPage.id: (context) => AdminsPage(),
  AboutUsPage.id: (context) => AboutUsPage(),
  AddUserPage.id: (context) => AddUserPage(),
  WelcomePage.id: (context) => WelcomePage(),
  SchedualPage.id: (context) => SchedualPage(),
  ShoppingCart.id: (context) => ShoppingCart(),
  ContactUsPage.id: (context) => ContactUsPage(),
  SearchResults.id: (context) => SearchResults(),
  BasketResults.id: (context) => BasketResults(),
  AddBasketPage.id: (context) => AddBasketPage(),
  AdminHomePage.id: (context) => AdminHomePage(),
  AddCompanyPage.id: (context) => AddCompanyPage(),
  AddProductPage.id: (context) => AddProductPage(),
  SuggestionsPage.id: (context) => SuggestionsPage(),
  SignedUsersPage.id: (context) => SignedUsersPage(),
  AddNewAdminPage.id: (context) => AddNewAdminPage(),
  CompanyMedcines.id: (context) => CompanyMedcines(),
  AdminSchedualPage.id: (context) => AdminSchedualPage(),
};
