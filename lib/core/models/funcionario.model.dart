import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:klenzer_app/core/models/enums/nivel_permissao.enum.dart';

part 'funcionario.model.g.dart';

@JsonSerializable()
class FuncionarioModel {
  int id;
  String nome;
  String cargo;
  NivelPermissao permissao;
  FuncionarioModel({
    @required this.id,
    @required this.nome,
    @required this.cargo,
    this.permissao,
  });

  factory FuncionarioModel.fromJson(Map<String, dynamic> json) =>
      _$FuncionarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioModelToJson(this);
}
