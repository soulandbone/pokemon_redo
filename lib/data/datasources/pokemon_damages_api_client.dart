import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class PokemonDamagesApiClient {
  PokemonDamagesApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<HttpResponse<String>> fetchPokemonDamagesInfo(String id);
}

class PokemonDamagesApiClientImpl implements PokemonDamagesApiClient {
  const PokemonDamagesApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<HttpResponse<String>> fetchPokemonDamagesInfo(String type) async {
    final uri = Uri.parse('https://pokeapi.co/api/v2/type/$type');

    return appHttpClient.getRaw(uri);
  }
}
