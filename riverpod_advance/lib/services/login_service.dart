import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_advance/constant/endpoints.dart';
import 'package:riverpod_advance/extension.dart';
import 'package:riverpod_advance/infrastructure/api_exception.dart';

abstract class LoginService {
  Future<bool> login(String username, String password);
}

class WCLoginService extends LoginService {
  @override
  Future<bool> login(String username, String password) async {
    try {
      Uri endpoint = Uri.parse(Endpoints.login);
      http.Response response = await http.post(
        endpoint,
        headers: { 'Content-Type': 'application/json' },
        body: jsonEncode({'username': username, 'password': password}),
      );
      if (response.isApiSuccessful) {
        Map<String, dynamic> json = jsonDecode(response.body);
        debugPrint('Token: ${json['accessToken']}');
        return true;
      } else {
        throw ApiException('Post', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
