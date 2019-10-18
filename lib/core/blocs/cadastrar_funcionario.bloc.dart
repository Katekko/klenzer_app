import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';
import 'package:klenzer_app/core/models/estado.model.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';
import 'package:klenzer_app/core/services/cliente.service.dart';
import 'package:klenzer_app/core/services/funcionario.service.dart';

class CadastrarFuncionarioBloc extends BlocBase {
  String _nome;
  void salvarNome({@required String nome}) {
    _nome = nome;
  }

  String _cargo;
  void salvarCargo({@required String cargo}) {
    _cargo = cargo;
  }

  Future<void> cadastrarFuncionario() async {
    var nome = _nome;
    var cargo = _cargo;

    FuncionarioService funcionarioService = FuncionarioService();

    await funcionarioService.postSalvarCliente(
      funcionario: FuncionarioModel(
        id: Random().nextInt(100),
        nome: nome,
        cargo: cargo,
      ),
    );
  }
}
