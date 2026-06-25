import 'dart:convert';

import 'package:pokemon_redo/data/network/app_http_client.dart';

class BasicPokemonApiClient {
  BasicPokemonApiClient(this.client);
  final AppHttpClient client;

  Future<List<Map<String, dynamic>>> fetchBasicPokemons({
    required int offset,
    required int limit,
  }) async {
    final uri = Uri(
      path: 'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit',
    );

    final response = await client.getRaw(uri);
    //was set to 1328
    final results = response.body;

    final json = jsonDecode(results);

    //CHECK
    return List<Map<String, dynamic>>.from(
      json.map((item) => Map<String, dynamic>.from(item)),
    );
  }
}
