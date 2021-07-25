// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;
// import 'package:pharma/Common/consts.dart';
// import 'package:pharma/models/UserModel.dart';

// class UserController {
//   UserModel userModel;
//   Future<List> getUserByName(String name) async {
//     var url = baseUrl + 'showusers';

//     Uri uri = Uri.parse(url);
//     final response = await http.get(uri);
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var json = convert.jsonDecode(response.body);
//       print(json);
//       List users = json;
//       List<String> string = [''];
//       List<UserModel> s;
//       s = users.map((user) => new UserModel.fromJson(user)).toList();
//       for (int i = 0; i < s.length; i++) {
//         print(s.length);
//         string.add(s[i].name);
//       }

//       return string;
//     } else {
//       throw Exception('Faild To get User');
//     }
//   }

// //sign in
// //sign up
// //post user
// //delete user
// //

// }
