import 'dart:io';

class ExcelService {
  final String name;

  ExcelService({this.name});

  void createTable(List<List<String>> data) {
    var file = File('$name.csv');
    var sink = file.openWrite();
    for (var row in data) {
      for (var cell in row) {
        sink.write('$cell , ');
      }
      sink.write('\n');
    }
    sink.close();
  }

  void insertNewRow(List<String> data) {
    var file = File('$name.csv');
    var sink = file.openWrite(mode: FileMode.append);
    sink.write('\n');
    for (var cell in data) {
      sink.write('$cell , ');
    }
    sink.close();
  }

  // List<List<String>> getTable(String filename) {
  //   var file = File('$filename.csv');
  // }
}

  // var file = Fexcel(name: 'filename');
  // List<List<String>> data = [
  //   [
  //     'price',
  //     'quantity',
  //     'offer',
  //   ],
  //   [
  //     '500.00',
  //     '1',
  //     '10 + 4',
  //   ],
  //   [
  //     '500.00',
  //     '4',
  //     '2 + 1',
  //   ],
  //   [
  //     '390.00',
  //     '1',
  //     '3 + 2',
  //   ],
  //   [
  //     '5880.00',
  //     '6',
  //     '4 + 1',
  //   ],
  // ];
  // // file.createTable(data);
  // file.insertNewRow(
  //   ['500.00', '5', 'non'],
  // );
