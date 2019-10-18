import 'package:klenzer_app/core/libs/rest.lib.dart';
import 'package:klenzer_app/core/models/servico.model.dart';
import 'package:klenzer_app/mocks/servicos.mock.dart';

class ServicoService {
  RestLib _rest = RestLib();

  void postSalvarServico({ServicoModel servico}) async {
    try {
      var body = {
        'descricao': servico.nome,
        'preco': servico.valor.toString(),
      };

      var cadastrado = await _rest.post(
        url: '/api/Servicos',
        body: body,
      );
      print(cadastrado);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<ServicoModel>> getTodosServicos() async {
    // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
    var servicos = await ServicosMock.getTodosServicos();
    return servicos;
  }
}
