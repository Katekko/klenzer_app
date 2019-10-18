import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_funcionario.bloc.dart';

class CargoWidget extends StatelessWidget {
  final TextEditingController _cargoController = TextEditingController();
   final CadastrarFuncionarioBloc _cadastrarFuncionarioBloc =
      BlocProvider.tag('CadastrarFuncionarioBloc').getBloc<CadastrarFuncionarioBloc>();

  @override
  Widget build(BuildContext context) {
    _cargoController.addListener(() {
      _cadastrarFuncionarioBloc.salvarCargo(
        cargo: _cargoController.text,
      );
    });
    return TextFormField(
      controller: _cargoController,
      style: TextStyle(fontSize: 20),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite um cargo!';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Cargo',
      ),
    );
  }
}
