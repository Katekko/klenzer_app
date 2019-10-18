import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/servico.model.dart';
import 'package:klenzer_app/core/services/servico.service.dart';

class CadastrarServicoBloc extends BlocBase {
  String _nome;
  void salvarNome({@required String nome}) {
    _nome = nome;
  }

  double _valor;
  void salvarValor({@required double valor}) {
    _valor = valor;
  }

  Future<void> cadastrarServico() async {
    var nome = _nome;
    var valor = _valor;

    ServicoService servicoService = ServicoService();

    await servicoService.postSalvarServico(
      servico: ServicoModel(nome: nome, valor: valor),
    );
  }
}
