import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';

class BairroWidget extends StatelessWidget {
  final TextEditingController _bairroController = TextEditingController();
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();

  @override
  Widget build(BuildContext context) {
    _bairroController.addListener(() {
      _cadastrarClienteBloc.salvarBairro(
        bairro: _bairroController.text,
      );
    });
    return TextFormField(
      controller: _bairroController,
      style: TextStyle(fontSize: 15),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite um bairro!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Bairro',
      ),
    );
  }
}
