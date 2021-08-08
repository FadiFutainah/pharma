import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/CompanyModel.dart';

class CompanyController {
  CompanyModel companyModel = CompanyModel();

// needs edit

  Future<String> addCompany(String companyName, String path) async {
    var url = baseUrl + 'inputcompany';
    Uri uri = Uri.parse(url);

    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(<String, String>{
        'Authorization': 'Bearer $token',
      });

      request.fields['name_company'] = companyName;

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          path,
          // contentType: MediaType('application', 'x-tar'),
        ),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        return 'Uploaded';
      }
      return 'failed';
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<List<String>> getCompaniesNames() async {
    List<CompanyModel> res = await getCompanies();
    List<String> items = [];
    for (var item in res) {
      items.add(item.name);
    }
    return items;
  }

  Future<List<CompanyModel>> getCompanies() async {
    var url = baseUrl + 'showcompany';

    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List companies = json;

        return companies
            .map((company) => new CompanyModel.fromJson(company))
            .toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
  // ossama
  // delete company
}
