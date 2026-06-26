import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_http_client.dart';
import 'app_http_client_dio.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final appHttpClientProvider = Provider<AppHttpClient>((ref) {
  final dioInstance = ref.read(dioProvider);
  return AppHttpClientDio(dioInstance);
});
