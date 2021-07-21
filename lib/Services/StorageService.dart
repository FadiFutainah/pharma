import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService extends FlutterSecureStorage {
  StorageService._constructer();

  static final StorageService _instance = StorageService._constructer();

  factory StorageService() => _instance;

  Future<void> saveToken(String data) async {
    await _instance.write(key: 'token', value: data);
  }

  Future<String> getToken() async {
    String data = await _instance.read(key: 'token');
    if (data != null) {
      return data;
    } else {
      return '';
    }
  }

  Future<void> deleteAllToken() async {
    await _instance.deleteAll();
  }

  Future<void> deleteToken() async {
    await _instance.delete(key: 'token');
  }
}
