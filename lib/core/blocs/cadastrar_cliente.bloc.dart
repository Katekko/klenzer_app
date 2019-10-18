import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';
import 'package:klenzer_app/core/models/estado.model.dart';
import 'package:klenzer_app/core/services/cliente.service.dart';

class CadastrarClienteBloc extends BlocBase {
  Future<List<EstadoModel>> carregarEstados() {
    return Future.value(<EstadoModel>[
      EstadoModel(nome: 'Espírito Santo', sigla: 'ES'),
      EstadoModel(nome: 'Acre', sigla: 'AC'),
      EstadoModel(nome: 'Alagoas', sigla: 'AL'),
      EstadoModel(nome: 'Amapá', sigla: 'AP'),
      EstadoModel(nome: 'Amazonas', sigla: 'Manaus'),
      EstadoModel(nome: 'Bahia', sigla: 'BA'),
      EstadoModel(nome: 'Ceará', sigla: 'CE'),
      EstadoModel(nome: 'Distrito Federal', sigla: 'DF'),
      EstadoModel(nome: 'Goiás', sigla: 'GO'),
      EstadoModel(nome: 'Maranhão', sigla: 'MA'),
      EstadoModel(nome: 'Mato Grosso', sigla: 'MT'),
      EstadoModel(nome: 'Mato Grosso do Sul', sigla: 'MS'),
      EstadoModel(nome: 'Minas Gerais', sigla: 'MG'),
      EstadoModel(nome: 'Pará', sigla: 'PA'),
      EstadoModel(nome: 'Paraíba', sigla: 'PB'),
      EstadoModel(nome: 'Paraná', sigla: 'PR'),
      EstadoModel(nome: 'Pernambuco', sigla: 'PE'),
      EstadoModel(nome: 'Piauí', sigla: 'PI'),
      EstadoModel(nome: 'Rio de Janeiro', sigla: 'RJ'),
      EstadoModel(nome: 'Rio Grande do Norte', sigla: 'RN'),
      EstadoModel(nome: 'Rio Grande do Sul', sigla: 'RS'),
      EstadoModel(nome: 'Rondônia', sigla: 'RO'),
      EstadoModel(nome: 'Roraima', sigla: 'RR'),
      EstadoModel(nome: 'Santa Catarina', sigla: 'SC'),
      EstadoModel(nome: 'São Paulo', sigla: 'SP'),
      EstadoModel(nome: 'Sergipe', sigla: 'SE'),
      EstadoModel(nome: 'Tocantins', sigla: 'TO'),
    ]);
  }

  String _nome;
  void salvarNome({@required String nome}) {
    _nome = nome;
  }

  String _estado;
  void salvarEstado({@required String estado}) {
    _estado = estado;
  }

  String _cidade;
  void salvarCidade({@required String cidade}) {
    _cidade = cidade;
  }

  String _bairro;
  void salvarBairro({@required String bairro}) {
    _bairro = bairro;
  }

  String _instagram;
  void salvarInstagram({@required String instagram}) {
    _instagram = instagram;
  }

  DateTime _date;
  void salvarData({@required DateTime date}) {
    _date = date;
  }

  Future<void> cadastrarCliente() async {
    var nome = _nome;
    var estado = _estado;
    var cidade = _cidade;
    var bairro = _bairro;
    var instagram = _instagram;
    var date = _date;

    ClienteService clienteService = ClienteService();

    await clienteService.postSalvarCliente(
      cliente: ClienteModel(
        id: Random().nextInt(100),
        nome: nome,
        estado: estado,
        cidade: cidade,
        bairro: bairro,
        instagram: instagram,
        aniversario: date,
      ),
    );
  }
}
