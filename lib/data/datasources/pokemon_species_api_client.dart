import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class PokemonSpeciesApiClient {
  PokemonSpeciesApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<HttpResponse<String>> fetchPokemonSpeciesInfo(String id);
}

class PokemonSpeciesApiClientImpl implements PokemonSpeciesApiClient {
  const PokemonSpeciesApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<HttpResponse<String>> fetchPokemonSpeciesInfo(String id) async {
    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id');

    return appHttpClient.getRaw(uri);
  }
}
