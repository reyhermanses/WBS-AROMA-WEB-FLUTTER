import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class RepositoryReport {
  post(reportNumber, name, title, description, token) async {
    var response = await http
        .post(
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

  list(token) async {
    var response = await http.get(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/getall'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    ).onError((error, stackTrace) async {
      await Future.delayed(Duration(seconds: 5));
      return http.Response(
          jsonEncode({
            'message': 'Check your network connection',
          }),
          408);
    });

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
    ).onError((error, stackTrace) async {
      await Future.delayed(Duration(seconds: 5));
      return http.Response(
          jsonEncode({
            'message': 'Check your network connection',
          }),
          408);
    });
    ;

    return response;
  }

  get_by_id(id, token) async {
    var response = await http.get(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/getbyid/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    ).onError((error, stackTrace) async {
      await Future.delayed(Duration(seconds: 5));
      return http.Response(
          jsonEncode({
            'message': 'Check your network connection',
          }),
          408);
    });

    return response;
  }

  update(id, reportNumber, name, title, description, token) async {
    var response = await http
        .put(
      Uri.parse(
          'http://aroma-backend-aroma-backend.apps.ocdev.jasamarga.co.id/api/v1/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
        <String, dynamic>{
          'nomor': reportNumber,
          'name': name,
          'title': title,
          'description': description
        },
      ),
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
}
