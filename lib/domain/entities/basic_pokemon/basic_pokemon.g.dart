// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicPokemonImpl _$$BasicPokemonImplFromJson(Map<String, dynamic> json) =>
    _$BasicPokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$BasicPokemonImplToJson(_$BasicPokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
