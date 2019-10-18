import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';
import 'package:klenzer_app/core/util/snackbar.lib.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  SubmitButton({@required this.formKey});

  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            _cadastrarClienteBloc.cadastrarCliente().then((_) {
              Navigator.of(context).pop(true);
            }).catchError((err) {
              SnackBarLib.showErrorSnackBar(
                context: context,
                text: err,
              );
            });
          }
        },
        color: Color(0xFF070618),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Cadastrar Cliente',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
