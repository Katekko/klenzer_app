import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';
import 'package:klenzer_app/core/models/servico.model.dart';

part 'horario.model.g.dart';

@JsonSerializable()
class HorarioModel {
  DateTime dataInicio;
  DateTime dataFim;
  ClienteModel cliente;
  List<ServicoModel> servicos;
  FuncionarioModel funcionario;
  HorarioModel({
    @required this.dataInicio,
    @required this.dataFim,
    @required this.cliente,
    @required this.servicos,
    @required this.funcionario,
  });

  factory HorarioModel.fromJson(Map<String, dynamic> json) =>
      _$HorarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorarioModelToJson(this);
}
