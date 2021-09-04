import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/Providers/ImagesProvider.dart';
import 'package:pharma/View/Components/DefaultSearchField.dart';
import 'package:pharma/View/Components/drawerGeneral.dart';
import 'package:pharma/controllers/BasketsController.dart';

import 'components/DefaultAppBar.dart';
import 'components/HomePageButton.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  final ImagesProvider provider = ImagesProvider();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BasketsController basketsController = new BasketsController();

  Future<List<Map<String, dynamic>>> futureBaskets;

  @override
  void initState() {
    futureBaskets = basketsController.getAllBaskets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.provider.loadLogo(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        child: DrawerGeneral(),
      ),
      appBar: DefaultBarHomePage(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              color: Theme.of(context).primaryColor,
            ),
            DefaultSearchField(),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    // decoration: BoxDecoration(
                    //     // borderRadius: BorderRadius.circular(30),
                    //     ),
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(40),
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(30),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: futureBaskets,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == null ||
                                    snapshot.data.length == 0) {
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
                                                'يرجى تسجيل الدخول أولاً',
                                                context);
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
                    showSnackBar('يرجى تسجيل الدخول أولاً', context);
                  },
                  icon: Icons.turned_in_not_outlined,
                  text: 'الأكثر مبيعاً',
                ),
                HomePageButton(
                  function: () {
                    showSnackBar('يرجى تسجيل الدخول أولاً', context);
                  },
                  icon: Icons.work_outline_sharp,
                  text: 'الشركات',
                ),
                HomePageButton(
                  function: () {
                    showSnackBar('يرجى تسجيل الدخول أولاً', context);
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
