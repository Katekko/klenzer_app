// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicoModel _$ServicoModelFromJson(Map<String, dynamic> json) {
  return ServicoModel(
    id: json['id'] as int,
    nome: json['nome'] as String,
    valor: (json['valor'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ServicoModelToJson(ServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'valor': instance.valor,
    };
