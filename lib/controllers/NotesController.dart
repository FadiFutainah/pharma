import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pharma/Common/consts.dart';
import 'package:pharma/models/NoteModel.dart';

class NotesController {
  Future<String> sendNote(NoteModel note) async {
    var url = baseUrl + 'sendnotesbyuser';
    try {
      var uri = Uri.parse(url);
      var respone = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(note.sendToJson()),
      );

      if (respone.statusCode == 200) {
        return 'تم ارسال الرسالة بنجاح';
      } else {
        return 'يوجد مشكلة في الشبكة';
      }
    } on Exception {
      return 'يوجد مشكلة في الشبكة';
    }
  }

  Future<List<NoteModel>> showNotes() async {
    var url = baseUrl + 'shownotestoadmin';
    try {
      var uri = Uri.parse(url);
      var response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        List notes = json;
        return notes.map((note) => NoteModel.fromJson(note)).toList();
      } else {
        return null;
      }
    } on TimeoutException {
      return null;
    } on Exception {
      return null;
    }
  }

  Future<String> deleteNote(int id) async {
    var url = baseUrl + 'deletenotesfromadmin/$id';
    try {
      var uri = Uri.parse(url);
      var response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'يوجد خطأ في الشبكة';
      }
    } on SocketException {
      return 'لا يوجد اتصال بالشبكة';
    } on Exception {
      return 'يوجد خطأ في الشبكة';
    }
  }
}
