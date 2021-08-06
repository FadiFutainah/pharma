import 'package:pharma/View/Components/SearchField.dart';
import 'package:pharma/View/Pages/Admin/AddBasketPage.dart';
import 'package:pharma/View/Pages/Admin/AddCompanyPage.dart';
import 'package:pharma/View/Pages/Admin/AddProductPage.dart';
import 'package:pharma/View/Pages/Admin/components/AdminDrawer.dart';
import 'package:pharma/View/Pages/Admin/components/ExpandableFab.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/BasketResult/BasketResult.dart';
import 'package:pharma/View/Pages/Contact-us/SuggestionsPage.dart';
import 'package:pharma/View/Pages/MostWantedProduct/MostWantedProducts.dart';
import 'package:pharma/View/Pages/companies/Companies.dart';
import 'package:pharma/controllers/BasketsController.dart';

import 'components/AdminAppBar.dart';

class AdminHomePage extends StatefulWidget {
  static const String id = '/AdminHomePage';

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  BasketsController basketsController = new BasketsController();
  // CompanyController companyController;

  Future<List<Map<String, dynamic>>> futureBaskets;
  // Future<List<CompanyModel>> futureCompany;
  List<String> images;

  @override
  void initState() {
    super.initState();
    // futureCompany = companyController.getCompanies();
    futureBaskets = basketsController.getAllBaskets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddBasketPage.id);
            },
            icon: const Icon(Icons.shopping_basket),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AddProductPage.id);
            },
            icon: const Icon(Icons.local_hospital),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddCompanyPage.id);
            },
            icon: const Icon(Icons.store),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: AdminDrawer(
          pharmacyName: 'زياد',
          userName: 'الحساب الرئيسي',
        ),
      ),
      appBar: AdminAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              color: Theme.of(context).primaryColor,
              //child: SearchField(),
            ),
            SearchField(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),

///////////////////////////////////////

////////////// first slider //////////////////

                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: futureBaskets,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return CarouselSlider.builder(
                                    options: CarouselOptions(
                                      autoPlay: true,

                                      ///dotColor: Colors.grey[400],
                                      //dotIncreaseSize: 1.2,
                                      //dotHorizontalPadding: 2,
                                      //dotBgColor: Colors.grey.withOpacity(0.1),
                                      //dotIncreasedColor: Colors.orange,
                                    ),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index, index1) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BasketResults(
                                                  basketsModel: snapshot
                                                      .data[index]["basket"],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Image.asset(
                                                      'images/basketsImage.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(snapshot.data[index]
                                                    ['sallatName']),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    ////////////// slider images here //////////////////
                                    );
                              } else if (snapshot.hasError) {
                                return Carousel(
                                  borderRadius: true,
                                  radius: Radius.circular(30),
                                  autoplay: true,
                                  dotColor: Colors.grey[400],
                                  dotIncreaseSize: 1.2,
                                  dotHorizontalPadding: 2,
                                  dotBgColor: Colors.grey.withOpacity(0.1),
                                  dotIncreasedColor: Colors.orange,

                                  images: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.asset(
                                              'images/basketsImage.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {
                                          setState(
                                            () {},
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.asset(
                                              'images/basketsImage.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  ////////////// slider images here //////////////////
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

////////////////////////////////

                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Card(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(2)),
                        onPressed: () {
                          Navigator.pushNamed(context, MostWanted.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: MediaQuery.of(context).size.height / 25,
                                color: Colors.grey[600],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'الأكثر مبيعاً',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 18,
                                ),
                                Icon(
                                  Icons.turned_in_not_outlined,
                                  size: MediaQuery.of(context).size.height / 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Card(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(2)),
                        onPressed: () {
                          Navigator.pushNamed(context, Companies.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: MediaQuery.of(context).size.height / 25,
                                color: Colors.grey[600],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'الشركات',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 18,
                                ),
                                Icon(
                                  Icons.work_outline_sharp,
                                  size: MediaQuery.of(context).size.height / 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Card(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(2)),
                        onPressed: () {
                          Navigator.pushNamed(context, SuggestionsPage.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                size: MediaQuery.of(context).size.height / 25,
                                color: Colors.grey[600],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'الاقتراحات والشكاوي',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .fontFamily,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 18,
                                ),
                                Icon(
                                  Icons.info_outline,
                                  size: MediaQuery.of(context).size.height / 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                    ),
                  ),
                ),

                /*Divider(
                endIndent: MediaQuery.of(context).size.width / 8,
                indent: MediaQuery.of(context).size.width / 8,
                color: Colors.black.withOpacity(0.4),
              ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
