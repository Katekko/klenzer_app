import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_servico.bloc.dart';

class NomeWidget extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final CadastrarServicoBloc _cadastrarServicoBloc =
      BlocProvider.tag('CadastrarServicoBloc').getBloc<CadastrarServicoBloc>();

  @override
  Widget build(BuildContext context) {
    _nomeController.addListener(() {
      _cadastrarServicoBloc.salvarNome(
        nome: _nomeController.text,
      );
    });
    return TextFormField(
      controller: _nomeController,
      style: TextStyle(fontSize: 20),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite um nome para o serviço!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Nome do serviço',
      ),
    );
  }
}
