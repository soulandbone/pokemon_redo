import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class PokemonDetailsApiClient {
  PokemonDetailsApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<HttpResponse<String>> fetchPokemonDetails(String url);
}

class PokemonDetailsApiClientImpl implements PokemonDetailsApiClient {
  const PokemonDetailsApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<HttpResponse<String>> fetchPokemonDetails(String url) async {
    final uri = Uri.parse(url);

    return appHttpClient.getRaw(uri);
  }
}
