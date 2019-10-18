import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:klenzer_app/core/blocs/cadastrar_servico.bloc.dart';

class ValorWidget extends StatelessWidget {
  final MoneyMaskedTextController _valorController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
  );
  final CadastrarServicoBloc _cadastrarServicoBloc =
      BlocProvider.tag('CadastrarServicoBloc').getBloc<CadastrarServicoBloc>();

  @override
  Widget build(BuildContext context) {
    _valorController.addListener(() {
      _cadastrarServicoBloc.salvarValor(
        valor: _valorController.numberValue,
      );
    });
    return TextFormField(
      controller: _valorController,
      style: TextStyle(fontSize: 20),
      validator: (_) {
        if (_valorController.numberValue <= .0) {
          return 'Digite um valor acima de zero!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Valor',
      ),
    );
  }
}
