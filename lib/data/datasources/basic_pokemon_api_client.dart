import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class BasicPokemonApiClient {
  BasicPokemonApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<HttpResponse<String>> fetchBasicPokemonData({
    required int offset,
    required int limit,
  });
}

class BasicPokemonApiClientImpl implements BasicPokemonApiClient {
  const BasicPokemonApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<HttpResponse<String>> fetchBasicPokemonData({
    required int offset,
    required int limit,
  }) async {
    final uri = Uri.parse(
      'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit',
    );

    return appHttpClient.getRaw(uri);
  }
}
