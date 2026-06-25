import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_pokemon.freezed.dart';
part 'basic_pokemon.g.dart';

@freezed
class BasicPokemon with _$BasicPokemon {
  const factory BasicPokemon({
    required int id,
    required String name,
    required String url,
  }) = _BasicPokemon;

  factory BasicPokemon.fromJson(Map<String, dynamic> json) =>
      _$BasicPokemonFromJson(json);
}

int extractIdFromUrl(String url) {
  final segments = url.split('/');
  return int.parse(segments[segments.length - 2]);
}
