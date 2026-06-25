import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pokemon_redo/core/exceptions.dart';
import 'package:pokemon_redo/data/network/app_http_client.dart';

class AppHttpClientDio implements AppHttpClient {
  AppHttpClientDio([Dio? dio])
    : _dio = dio ?? Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  final Dio _dio;

  @override
  Future<HttpResponse<String>> getRaw(
    Uri url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    try {
      final response = await _dio.get<String>(
        url.toString(),
        options: Options(
          responseType: ResponseType.plain,
          headers: headers,
          connectTimeout: timeout ?? Duration(seconds: 10),
        ),
      );

      final statusCode = response.statusCode;

      if (statusCode == null) {
        throw StateError('Response has no status code');
      }

      if (statusCode < 200 || statusCode >= 300) {
        throw ApiException(
          'HTTP: ${response.statusCode}',
          body: response.data?.toString(),
          statusCode: response.statusCode,
        );
      }

      return HttpResponse<String>(
        statusCode: response.statusCode,
        body: response.data ?? '',
        headers: _mapHeaders(response.headers),
      );
    } on TimeoutException {
      throw CustomTimeoutException();
    }
  }
}

Map<String, String> _mapHeaders(Headers headers) {
  final result = <String, String>{};
  headers.forEach((key, values) {
    // Join multiple values with comma, or choose values.first if you prefer
    result[key] = values.join(',');
  });
  return result;
}
