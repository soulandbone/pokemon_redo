// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BasicPokemon _$BasicPokemonFromJson(Map<String, dynamic> json) {
  return _BasicPokemon.fromJson(json);
}

/// @nodoc
mixin _$BasicPokemon {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this BasicPokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicPokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicPokemonCopyWith<BasicPokemon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPokemonCopyWith<$Res> {
  factory $BasicPokemonCopyWith(
    BasicPokemon value,
    $Res Function(BasicPokemon) then,
  ) = _$BasicPokemonCopyWithImpl<$Res, BasicPokemon>;
  @useResult
  $Res call({int id, String name, String url});
}

/// @nodoc
class _$BasicPokemonCopyWithImpl<$Res, $Val extends BasicPokemon>
    implements $BasicPokemonCopyWith<$Res> {
  _$BasicPokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicPokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BasicPokemonImplCopyWith<$Res>
    implements $BasicPokemonCopyWith<$Res> {
  factory _$$BasicPokemonImplCopyWith(
    _$BasicPokemonImpl value,
    $Res Function(_$BasicPokemonImpl) then,
  ) = __$$BasicPokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String url});
}

/// @nodoc
class __$$BasicPokemonImplCopyWithImpl<$Res>
    extends _$BasicPokemonCopyWithImpl<$Res, _$BasicPokemonImpl>
    implements _$$BasicPokemonImplCopyWith<$Res> {
  __$$BasicPokemonImplCopyWithImpl(
    _$BasicPokemonImpl _value,
    $Res Function(_$BasicPokemonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BasicPokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? url = null}) {
    return _then(
      _$BasicPokemonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicPokemonImpl implements _BasicPokemon {
  const _$BasicPokemonImpl({
    required this.id,
    required this.name,
    required this.url,
  });

  factory _$BasicPokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicPokemonImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'BasicPokemon(id: $id, name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicPokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url);

  /// Create a copy of BasicPokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicPokemonImplCopyWith<_$BasicPokemonImpl> get copyWith =>
      __$$BasicPokemonImplCopyWithImpl<_$BasicPokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicPokemonImplToJson(this);
  }
}

abstract class _BasicPokemon implements BasicPokemon {
  const factory _BasicPokemon({
    required final int id,
    required final String name,
    required final String url,
  }) = _$BasicPokemonImpl;

  factory _BasicPokemon.fromJson(Map<String, dynamic> json) =
      _$BasicPokemonImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get url;

  /// Create a copy of BasicPokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicPokemonImplCopyWith<_$BasicPokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
