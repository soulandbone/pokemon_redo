import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class PokemonDetailsApiClient {
  PokemonDetailsApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<String> fetchPokemonDetails(String url);
}

class PokemonDetailsApiClientImpl implements PokemonDetailsApiClient {
  const PokemonDetailsApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<String> fetchPokemonDetails(String url) async {
    final uri = Uri.parse(url);

    return appHttpClient.get(uri);
  }
}
