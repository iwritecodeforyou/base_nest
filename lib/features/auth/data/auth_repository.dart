
import 'package:base_nest/services/api_service.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  Future<Map<String, dynamic>> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final response = await ApiService.post(context, '/api/login', {
      'email': email,
      'password': password,
    });

    return response;
  }

  Future<Map<String, dynamic>> registerUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final response = await ApiService.post(context, '/api/register', {
      'email': email,
      'password': password,
    });

    return response;
  }
}
