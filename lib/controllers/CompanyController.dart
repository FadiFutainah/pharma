import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/CompanyModel.dart';

class CompanyController {
  CompanyModel companyModel = CompanyModel();

// needs edit

  // Future<String> addCompany(CompanyModel companyModel) async {
  //   var url = baseUrl + 'inputcompany';
  //   Uri uri = Uri.parse(url);
  //   final respone = await http.post(url, body: companyModel.toJson(), headers: {
  //     'Authorization': 'Bearer $token',
  //   });
  // }

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
}
