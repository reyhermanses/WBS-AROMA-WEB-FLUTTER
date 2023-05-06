import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class RepositoryAuth {
  login(String username, String password) async {
    var response = await http.post(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    return response;
  }

  store_token(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: 'jwt', value: token);
  }

  check_token() async {
    if (await read_token() != null && await read_token() != "") {
      return true;
    } else {
      return false;
    }
  }

  read_token() async {
    final storage = new FlutterSecureStorage();
    return storage.read(key: 'jwt');
  }

  remove_token() async {
    final storage = new FlutterSecureStorage();
    storage.delete(key: 'jwt');
  }
}
