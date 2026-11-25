import 'package:pokemon_redo/data/network/app_http_client.dart';

abstract class PokemonDamagesApiClient {
  PokemonDamagesApiClient(this.appHttpClient);

  final AppHttpClient appHttpClient;

  Future<String> fetchPokemonDamagesInfo(String type);
}

class PokemonDamagesApiClientImpl implements PokemonDamagesApiClient {
  const PokemonDamagesApiClientImpl(this.appHttpClient);
  @override
  final AppHttpClient appHttpClient;

  @override
  Future<String> fetchPokemonDamagesInfo(String type) async {
    final uri = Uri.parse('https://pokeapi.co/api/v2/type/$type');

    return appHttpClient.get(uri);
  }
}
