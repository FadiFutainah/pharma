import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/ImagesProvider.dart';
import 'package:pharma/View/Components/SearchField.dart';
import 'package:pharma/View/Pages/Admin/AddBasketPage.dart';
import 'package:pharma/View/Pages/Admin/AddNewAdminPage.dart';
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
import 'components/HomePageButton.dart';

class AdminHomePage extends StatefulWidget {
  static const String id = '/AdminHomePage';
  final ImagesProvider provider = ImagesProvider();

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  BasketsController basketsController = new BasketsController();

  Future<List<Map<String, dynamic>>> futureBaskets;
  List<String> images;

  @override
  void initState() {
    super.initState();
    futureBaskets = basketsController.getAllBaskets();
  }

  @override
  Widget build(BuildContext context) {
    widget.provider.loadLogo(context);
    // widget.provider.loadScheduale(context);
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
              Navigator.of(context).pushNamed(AddProductPage.id);
            },
            icon: const Icon(Icons.local_hospital),
          ),
          ActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewAdminPage.id);
            },
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: AdminDrawer(),
      ),
      appBar: AdminAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              color: Theme.of(context).primaryColor,
            ),
            SearchField(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
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
                                if (snapshot.data.length == 0) {
                                  return Carousel(
                                    borderRadius: true,
                                    radius: Radius.circular(30),
                                    autoplay: true,
                                    dotColor: Colors.transparent,
                                    dotIncreaseSize: 1.2,
                                    dotHorizontalPadding: 2,
                                    dotBgColor: Colors.transparent,
                                    dotIncreasedColor: Colors.transparent,
                                    images: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Text('لا يوجد عروض'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CarouselSlider.builder(
                                    options: CarouselOptions(
                                      autoPlay: true,
                                    ),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index, index1) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {
                                            showSnackBar(
                                                'لا يمكنك الدخول', context);
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.36,
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data[index]
                                                        ['sallatName'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              12,
                                                      color: Colors.blue[700],
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    40,
                                              ),
                                              Icon(
                                                Icons.redeem,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    8,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Carousel(
                                  borderRadius: true,
                                  radius: Radius.circular(30),
                                  autoplay: true,
                                  dotColor: Colors.transparent,
                                  dotIncreaseSize: 1.2,
                                  dotHorizontalPadding: 2,
                                  dotBgColor: Colors.transparent,
                                  dotIncreasedColor: Colors.transparent,
                                  images: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Center(
                                          child: Text('يوجد خطأ في الشبكة'),
                                        ),
                                      ),
                                    ),
                                  ],
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
                HomePageButton(
                  function: () {
                    Navigator.of(context).pushNamed(MostWanted.id);
                  },
                  icon: Icons.turned_in_not_outlined,
                  text: 'الأكثر مبيعاً',
                ),
                HomePageButton(
                  function: () {
                    Navigator.of(context).pushNamed(Companies.id);
                  },
                  icon: Icons.work_outline_sharp,
                  text: 'الشركات',
                ),
                HomePageButton(
                  function: () {
                    Navigator.of(context).pushNamed(SuggestionsPage.id);
                  },
                  icon: Icons.info_outline,
                  text: 'الاقتراحات والشكاوي',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
