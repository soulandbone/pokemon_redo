import 'package:get_it/get_it.dart';
import 'package:pokemon_redo/data/network/app_http_client.dart';
import 'package:pokemon_redo/data/network/app_http_client_dio.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AppHttpClient>(() => AppHttpClientDio());
}
