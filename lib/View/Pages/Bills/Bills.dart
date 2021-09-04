import 'package:get/get.dart';
import 'package:pharma/Services/Services.dart';
import 'package:pharma/View/Components/BillTable.dart';
import 'package:flutter/material.dart';
import 'package:pharma/controllers/BillController.dart';
import 'package:pharma/models/AllBillsModel.dart';
import 'package:pharma/models/BillModel.dart';

class Bills extends StatefulWidget {
  static const String id = 'Bills';

  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  BillController billController = new BillController();

  Future<AllBillsModel> futureBill;
  AllBillsModel bills = AllBillsModel();
  List<BillModel> billModel = [];
  @override
  initState() {
    super.initState();

    futureBill = billController.getBillsByUser();
    futureBill.then((value) {
      setState(() {
        bills = value;
      });
    });

    billModel = Services.convertToListOfBillModel(
        bills.billModel, bills.billSallatModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Color(0xffffb52d),
        elevation: 0,
        title: Text(
          'الفواتير',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: billModel.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      billModel[index].createdAt.toString().substring(0, 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      child: BillTable(
                        billModel: billModel[index],
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
      ),
    );
  }
}
