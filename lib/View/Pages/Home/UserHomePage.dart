import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharma/Providers/ImagesProvider.dart';
import 'package:pharma/View/Components/SearchField.dart';
import 'package:pharma/View/Components/barHomeBage.dart';
import 'package:pharma/View/Components/drawerGeneral.dart';
import 'package:pharma/View/Components/drawerGeneralAuth.dart';
import 'package:pharma/View/Pages/BasketResult/BasketResult.dart';
import 'package:pharma/View/Pages/Contact-us/ContactUsPage.dart';
import 'package:pharma/View/Pages/MostWantedProduct/MostWantedProducts.dart';
import 'package:pharma/View/Pages/companies/Companies.dart';
import 'package:pharma/controllers/BasketsController.dart';

import 'components/HomePageButton.dart';

class UserHomePage extends StatefulWidget {
  static const String id = '/HomePage';
  final ImagesProvider provider = ImagesProvider();

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  BasketsController basketsController = new BasketsController();

  Future<List<Map<String, dynamic>>> futureBaskets;

  // delete when end

  // Future<void> test() async {
  //   SharedPreferences s = await SharedPreferences.getInstance();
  //   s.clear();
  // }

  @override
  void initState() {
    // test();
    futureBaskets = basketsController.getAllBaskets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.provider.loadLogo(context);
    widget.provider.loadLogo(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: DrawerGeneralAuth(),
      ),
      appBar: BarHomePage(),
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
                                if (snapshot.data == null) {
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
                                          child: Center(
                                            child: Text(
                                              snapshot.data[index]
                                                  ['sallatName'],
                                              style: TextStyle(fontSize: 30),
                                            ),
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
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                'لا يوجد عروض',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ),
                                          ],
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
                    Navigator.of(context).pushNamed(ContactUsPage.id);
                  },
                  icon: Icons.info_outline,
                  text: 'تواصل معنا',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
