import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente.model.g.dart';

@JsonSerializable()
class ClienteModel {
  int id;
  String nome;
  String estado;
  String cidade;
  String bairro;
  String instagram;
  DateTime aniversario;
  ClienteModel({
    @required this.id,
    @required this.nome,
    @required this.estado,
    @required this.cidade,
    @required this.bairro,
    @required this.instagram,
    this.aniversario,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);
}
