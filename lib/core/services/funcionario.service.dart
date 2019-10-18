import 'package:klenzer_app/core/libs/rest.lib.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';
import 'package:klenzer_app/mocks/funcionarios.mock.dart';

class FuncionarioService {
  RestLib _rest = RestLib();

  void postSalvarCliente({FuncionarioModel funcionario}) async {
    try {
      // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
      await FuncionariosMock.salvarFuncionario(funcionario: funcionario);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<FuncionarioModel>> getTodosFuncionarios() async {
    // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
    var funcionarios = await FuncionariosMock.getTodosFuncionarios();
    return funcionarios;
  }
}
