import 'package:flutter/material.dart';
import 'package:pharma/View/Pages/CompanyMedcines/CompanyMedcines.dart';
import 'package:pharma/View/Pages/Home/components/bar.dart';
import 'package:pharma/View/Pages/companies/components/drawer.dart';
import 'package:pharma/controllers/CompanyController.dart';
import 'package:pharma/models/CompanyModel.dart';

class Companies extends StatefulWidget {
  static const String id = 'Companies';

  ///const Companies({ Key? key }) : super(key: key);

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
      appBar: Bar(),
      drawer: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          child: MainpageDrawer(
            userName: 'احمد',
            pharmacyName: 'الصيدلية المركزية',
          )),
      body: FutureBuilder(
          future: futureCompany,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                                      )));

                          ///print(testLest[index].logo);
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                                'images/' + snapshot.data[index].image),
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
            } else if (snapshot.hasError) {
              return Center(child: Text('لا يوجد اتصال بالانترنت'));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
