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
}
