import 'package:flutter/material.dart';
import 'package:pharma/Common/consts.dart';
import 'package:pharma/View/Components/barGanaral.dart';
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
      appBar: BarGeneral(
        title: 'الشركات',
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
                itemBuilder: (buildContext, int index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompanyMedcines(
                                companyId: snapshot.data[index].id,
                                companyName: snapshot.data[index].name,
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(60)),
                            child: Image.network(
                              imgUrl + snapshot.data[index].image,
                              fit: BoxFit.fill,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace stackTrace) {
                                return Icon(
                                  Icons.photo,
                                  color: Colors.grey,
                                  size: 150,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
