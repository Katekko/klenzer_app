import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';

class CidadeWidget extends StatelessWidget {
  final TextEditingController _cidadeController = TextEditingController();
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();

  @override
  Widget build(BuildContext context) {
    _cidadeController.addListener(() {
      _cadastrarClienteBloc.salvarCidade(
        cidade: _cidadeController.text,
      );
    });
    return TextFormField(
      controller: _cidadeController,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite uma cidade!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Cidade',
      ),
    );
  }
}
