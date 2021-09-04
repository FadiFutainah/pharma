import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Components/GeneralAppBar.dart';
import 'package:pharma/View/Pages/CompanyMedcines/CompanyMedcines.dart';
import 'package:pharma/controllers/CompanyController.dart';
import 'package:pharma/models/CompanyModel.dart';

class Companies extends StatefulWidget {
  static const String id = 'Companies';

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  CompanyController companyController = new CompanyController();

  Future<List<CompanyModel>> futureCompany;

  @override
  void initState() {
    super.initState();
    futureCompany = companyController.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: 'الشركات',
        hasShoppingCart: false,
      ),
      body: FutureBuilder(
        future: futureCompany,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return Center(child: Text('لا يوجد شركات'));
            } else {
              return GridView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (buildContext, int index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        CompanyMedcines(
                          companyId: snapshot.data[index].id,
                          companyName: snapshot.data[index].name,
                        ),
                      );
                    },
                    child: Center(
                      child: Image.network(
                        imgUrl + snapshot.data[index].image,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                          return Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey,
                            size: 150,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
