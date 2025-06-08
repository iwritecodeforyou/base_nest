import 'dart:async';
import 'dart:io';

import 'package:base_nest/core/utils/logger.dart';
import 'package:base_nest/services/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'connectivity_service.dart';
import 'exceptions/api_exceptions.dart';


class ApiService {
  static final Dio _dio = DioClient().dio;
  static const Duration _requestTimeout = Duration(seconds: 10);

  static Future<dynamic> get(BuildContext context, String endpoint) async {
    return await _performSafeRequest(context, () => _dio.get(endpoint), endpoint);
  }

  static Future<dynamic> post(BuildContext context, String endpoint, Map<String, dynamic> data) async {
    return await _performSafeRequest(context, () => _dio.post(endpoint, data: data), endpoint);
  }

  static Future<dynamic> put(BuildContext context, String endpoint, Map<String, dynamic> data) async {
    return await _performSafeRequest(context, () => _dio.put(endpoint, data: data), endpoint);
  }

  static Future<dynamic> delete(BuildContext context, String endpoint) async {
    return await _performSafeRequest(context, () => _dio.delete(endpoint), endpoint);
  }

  static Future<dynamic> _performSafeRequest(
      BuildContext context,
      Future<Response> Function() requestFunction,
      String url,
      ) async {
    try {
      final isConnected = Provider.of<ConnectivityService>(context, listen: false).isConnected;

 LoggerService.debug('🌐 Connectivity → $isConnected');
      if (!isConnected) {
        throw NetworkException(message: 'No Internet Connection');
      }

      LoggerService.debug('🌐 Request → $url');
      final response = await requestFunction().timeout(_requestTimeout);
      LoggerService.debug('✅ Response → ${response.statusCode} ${response.data}');
      return _handleResponse(response);
    } on SocketException {
      throw NetworkException(message: 'No Internet connection.');
    } on TimeoutException {
      throw NetworkException(message: 'Request timed out. Please try again.');
    } on DioException catch (e) {
      LoggerService.error('❌ DioError: ${e.message}');
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkException(message: 'Request timed out. Please try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(message: 'No internet connection.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw ApiException(
          message: data is Map ? data['error'] ?? 'API Error' : 'Unknown API error',
          statusCode: statusCode,
        );
      } else {
        throw ApiException(message: e.message ?? 'Unexpected error', statusCode: statusCode);
      }
    } catch (e) {
      LoggerService.error('❌ Unexpected error: $e');
      throw e is ApiException ? e : NetworkException(message: e.toString());

    }
  }

  static dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(
          message: response.data['error'] ?? 'Bad Request',
          statusCode: response.statusCode,
        );
      case 401:
      case 403:
        throw UnauthorizedException(
          message: response.data['error'] ?? 'Unauthorized',
          statusCode: response.statusCode,
        );
      case 404:
        throw NotFoundException(
          message: response.data['error'] ?? 'Not Found',
          statusCode: response.statusCode,
        );
      case 500:
      default:
        throw InternalServerErrorException(
          message: 'Server error',
          statusCode: response.statusCode,
        );
    }
  }
}
