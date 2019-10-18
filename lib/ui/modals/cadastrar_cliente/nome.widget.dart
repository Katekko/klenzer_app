import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';

class NomeWidget extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();

  @override
  Widget build(BuildContext context) {
    _nomeController.addListener(() {
      _cadastrarClienteBloc.salvarNome(
        nome: _nomeController.text,
      );
    });
    return TextFormField(
      controller: _nomeController,
      style: TextStyle(fontSize: 20),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite um nome!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Nome',
      ),
    );
  }
}
