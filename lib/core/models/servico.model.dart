import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'servico.model.g.dart';

@JsonSerializable()
class ServicoModel {
  int id;
  String nome;
  double valor;
  ServicoModel({this.id, @required this.nome, @required this.valor});

  factory ServicoModel.fromJson(Map<String, dynamic> json) =>
      _$ServicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoModelToJson(this);
}
