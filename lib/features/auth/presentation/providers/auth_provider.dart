
import 'package:base_nest/core/utils/logger.dart';
import 'package:base_nest/features/auth/data/auth_repository.dart';
import 'package:base_nest/services/exceptions/api_exceptions.dart';
import 'package:base_nest/services/local_storage_service.dart';

import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final LocalStorageService _localStorageService = LocalStorageService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _authRepository.loginUser(  email: email, password: password, context: context);
      final token = response['token'];

      if (token != null) {
        LoggerService.info('Login successful. Token: $token');
        await _localStorageService.saveToken(token);
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      String errorMessage = 'Something went wrong';
      if (error is ApiException) {
        errorMessage = error.message;
      } else if (error is Exception) {
        errorMessage = error.toString().replaceAll('Exception:', '').trim();
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
      return false;
    }
  }

  Future<void> logout() async {
    await _localStorageService.clearToken();
    notifyListeners();
  }
}
