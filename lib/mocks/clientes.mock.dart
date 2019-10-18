import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';

class ClientesMock {
  static List<ClienteModel> clientes = List();
  static Future<dynamic> salvarCliente({@required ClienteModel cliente}) async {
    clientes.add(cliente);
    return Future.delayed(Duration(seconds: 3));
  }

  static Future<List<ClienteModel>> getTodosClientes() async {
    await Future.delayed(Duration(seconds: 1));
    return clientes;
  }
}
