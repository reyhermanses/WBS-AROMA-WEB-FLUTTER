import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class RepositoryReport {
  post(reportNumber, name, title, description, token) async {
    var response = await http.post(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'nomor': reportNumber.toString(),
        'name': name,
        'title': title,
        'description': description
      }),
    );
    return response;
  }

  list(token) async {
    var response = await http.get(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/getall'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    return response;
  }

  delete(id, token) async {
    var response = await http.delete(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    return response;
  }
}
