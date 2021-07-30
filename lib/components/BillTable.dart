import 'package:flutter/material.dart';
import 'package:pharma/models/BillModel.dart';

class BillTable extends StatelessWidget {
  BillModel billModel;
  BillTable({Key key, this.billModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TableRow> list = [];

    for (int i = 0; i < billModel.products.length; i++) {
      list.add(TableRow(
        children: [
          Text(
            billModel.products[i].pivotModel.total.toString(),
            textAlign: TextAlign.center,
          ),
          Text(billModel.products[i].price.toString(),
              textAlign: TextAlign.center),

          ///Text(billModel.products[i]..toString(), textAlign: TextAlign.center),
          Text((billModel.products[i].quantity).toString(),
              textAlign: TextAlign.center),
          Text(billModel.products[i].name.toString(),
              textAlign: TextAlign.center),
        ],
      ));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            child: Table(
              columnWidths: {
                1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.25),
              },
              border: TableBorder(
                bottom: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black),
                horizontalInside: BorderSide(color: Colors.black),
                verticalInside: BorderSide(color: Colors.black),
              ),
              children: [
                TableRow(
                  children: [
                    Text(
                      'الاجمالي',
                      textAlign: TextAlign.center,
                    ),
                    Text('السعر', textAlign: TextAlign.center),

                    ///Text('المجاني', textAlign: TextAlign.center),
                    Text('الكمية', textAlign: TextAlign.center),
                    Text('الصنف', textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) => Container(
              child: Table(
                columnWidths: {
                  1: FixedColumnWidth(MediaQuery.of(context).size.width * 0.25),
                },
                border: TableBorder(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  horizontalInside: BorderSide(color: Colors.black),
                  verticalInside: BorderSide(color: Colors.black),
                ),
                children: [
                  list[index],
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Container(
            child: Table(
              columnWidths: {
                0: FixedColumnWidth(MediaQuery.of(context).size.width / 4.252),
                2: FixedColumnWidth(MediaQuery.of(context).size.width / 4.252),
              },
              border: TableBorder(
                bottom: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black),
                horizontalInside: BorderSide(color: Colors.black),
                verticalInside: BorderSide(color: Colors.black),
              ),
              children: [
                TableRow(
                  children: [
                    Text(
                      '',
                      textAlign: TextAlign.center,
                    ),
                    Text('', textAlign: TextAlign.center),
                    Text('صافي الفاتورة', textAlign: TextAlign.center),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      billModel.fullTotal.toString(),
                      textAlign: TextAlign.center,
                    ),
                    Text('', textAlign: TextAlign.center),
                    Text('الرصيد الاجمالي', textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
