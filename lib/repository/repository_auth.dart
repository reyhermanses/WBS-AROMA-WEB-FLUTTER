import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class RepositoryAuth {
  final storage = new FlutterSecureStorage();
  login(String username, String password) async {
    var response = await http
        .post(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    )
        .onError((error, stackTrace) async {
      await Future.delayed(Duration(seconds: 5));
      return http.Response(
          jsonEncode({
            'message': 'Check your network connection',
          }),
          408);
    });
    return response;
  }

  store_token(String token) async {
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
    return await storage.read(key: 'jwt');
  }

  remove_token() async {
    await storage.delete(key: 'jwt');
  }
}
