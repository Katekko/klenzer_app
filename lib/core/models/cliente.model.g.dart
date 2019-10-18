// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) {
  return ClienteModel(
    id: json['id'] as int,
    nome: json['nome'] as String,
    estado: json['estado'] as String,
    cidade: json['cidade'] as String,
    bairro: json['bairro'] as String,
    instagram: json['instagram'] as String,
    aniversario: json['aniversario'] == null
        ? null
        : DateTime.parse(json['aniversario'] as String),
  );
}

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'estado': instance.estado,
      'cidade': instance.cidade,
      'bairro': instance.bairro,
      'instagram': instance.instagram,
      'aniversario': instance.aniversario?.toIso8601String(),
    };
