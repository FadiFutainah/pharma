import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/CompanyModel.dart';

class CompanyController {
  ///final String baseUrl = 'http://'+MyApp.uri.toString()+':8000/api/';
  // final String baseUrl = 'http://192.168.1.102:8000/api/';
  CompanyModel companyModel;

  Future<String> addCompany(CompanyModel companyModel) async {
    var url = baseUrl + 'inputcompany';
    Uri uri = Uri.parse(url);
    final respone = await http.post(url, body: companyModel.toJson());
  }

  //get companies
  Future<List<CompanyModel>> getCompanies() async {
    var url = baseUrl + 'showcompany';

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List companies = json;
      return companies
          .map((company) => new CompanyModel.fromJson(company))
          .toList();
    } else {
      throw Exception('Faild To get companies');
    }
  }
}
