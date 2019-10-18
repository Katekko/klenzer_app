import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/servico.model.dart';

class ServicosMock {
  static List<ServicoModel> servicos = List();
  static Future<dynamic> salvarServico({
    @required ServicoModel servico,
  }) async {
    servicos.add(servico);
    return Future.delayed(Duration(seconds: 3));
  }

  static Future<List<ServicoModel>> getTodosServicos() async {
    await Future.delayed(Duration(seconds: 1));
    return servicos;
  }
}
