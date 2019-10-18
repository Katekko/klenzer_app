// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncionarioModel _$FuncionarioModelFromJson(Map<String, dynamic> json) {
  return FuncionarioModel(
    id: json['id'] as int,
    nome: json['nome'] as String,
    cargo: json['cargo'] as String,
    permissao: _$enumDecodeNullable(_$NivelPermissaoEnumMap, json['permissao']),
  );
}

Map<String, dynamic> _$FuncionarioModelToJson(FuncionarioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cargo': instance.cargo,
      'permissao': _$NivelPermissaoEnumMap[instance.permissao],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$NivelPermissaoEnumMap = {
  NivelPermissao.ADMIN: 'ADMIN',
  NivelPermissao.FUNCIONARIO: 'FUNCIONARIO',
};
