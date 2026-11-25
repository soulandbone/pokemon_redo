import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pokemon_redo/core/exceptions.dart';
import 'package:pokemon_redo/data/network/app_http_client.dart';

class AppHttpClientDio implements AppHttpClient {
  AppHttpClientDio([Dio? dio])
    : _dio = dio ?? Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  final Dio _dio;

  @override
  Future<String> get(Uri url) async {
    try {
      final response = await _dio.get<String>(
        url.toString(),
        options: Options(responseType: ResponseType.plain),
      );

      final statusCode = response.statusCode;

      if (statusCode == null) {
        throw StateError('Response has no status code');
      }

      if (statusCode < 200 || statusCode >= 300) {
        throw ApiException(
          'HTTP: $statusCode',
          body: response.data,
          statusCode: statusCode,
        );
      }

      final data = response.data;
      if (data == null) {
        throw ApiException(
          'The body is empty, the status code is $statusCode',
          statusCode: statusCode,
        );
      }

      return data;
    } on TimeoutException {
      throw CustomTimeoutException();
    }
  }
}
