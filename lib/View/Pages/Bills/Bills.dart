import 'package:pharma/View/Components/BillTable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/controllers/BillController.dart';
import 'package:pharma/models/BillModel.dart';

class Bills extends StatefulWidget {
  static const String id = 'Bills';

  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  BillController billController = new BillController();

  Future<List<BillModel>> futureBill;

  @override
  void initState() {
    super.initState();
    futureBill = billController.getBillsByUser(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///backgroundColor: Color(0xffffb52d),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        title: Text(
          'الفواتير',
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height / 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureBill,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(snapshot.data[index].createdAt),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            child: BillTable(
                              billModel: snapshot.data[index],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('لا يوجد اتصال بالانترنت'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
