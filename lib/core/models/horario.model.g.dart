// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horario.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HorarioModel _$HorarioModelFromJson(Map<String, dynamic> json) {
  return HorarioModel(
    dataInicio: json['dataInicio'] == null
        ? null
        : DateTime.parse(json['dataInicio'] as String),
    dataFim: json['dataFim'] == null
        ? null
        : DateTime.parse(json['dataFim'] as String),
    cliente: json['cliente'] == null
        ? null
        : ClienteModel.fromJson(json['cliente'] as Map<String, dynamic>),
    servicos: (json['servicos'] as List)
        ?.map((e) =>
            e == null ? null : ServicoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    funcionario: json['funcionario'] == null
        ? null
        : FuncionarioModel.fromJson(
            json['funcionario'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HorarioModelToJson(HorarioModel instance) =>
    <String, dynamic>{
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'dataFim': instance.dataFim?.toIso8601String(),
      'cliente': instance.cliente,
      'servicos': instance.servicos,
      'funcionario': instance.funcionario,
    };
