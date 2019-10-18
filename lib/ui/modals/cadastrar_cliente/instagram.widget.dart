import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';

class InstagramWidget extends StatelessWidget {
  final TextEditingController _instagramController = TextEditingController();
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();


  @override
  Widget build(BuildContext context) {
    _instagramController.addListener(() {
      _cadastrarClienteBloc.salvarInstagram(
        instagram: _instagramController.text,
      );
    });
    return TextFormField(
      controller: _instagramController,
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        labelText: 'Instagram',
      ),
    );
  }
}
