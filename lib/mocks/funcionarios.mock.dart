import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';

class FuncionariosMock {
  static List<FuncionarioModel> funcionarios = List();
  static Future<dynamic> salvarFuncionario({
    @required FuncionarioModel funcionario,
  }) async {
    funcionarios.add(funcionario);
    return Future.delayed(Duration(seconds: 3));
  }

  static Future<List<FuncionarioModel>> getTodosFuncionarios() async {
    await Future.delayed(Duration(seconds: 1));
    return funcionarios;
  }
}
