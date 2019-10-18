import 'package:klenzer_app/core/libs/rest.lib.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';
import 'package:klenzer_app/mocks/clientes.mock.dart';

class ClienteService {
  RestLib _rest = RestLib();

  void postSalvarCliente({ClienteModel cliente}) async {
    try {
      // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
      await ClientesMock.salvarCliente(cliente: cliente);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<ClienteModel>> getTodosClientes() async {
    // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
    var clientes = await ClientesMock.getTodosClientes();
    return clientes;
  }
}
