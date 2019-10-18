import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';
import 'package:klenzer_app/core/blocs/cadastrar_funcionario.bloc.dart';
import 'package:klenzer_app/core/blocs/cadastrar_servico.bloc.dart';
import 'package:klenzer_app/core/util/snackbar.lib.dart';
import 'package:klenzer_app/ui/modals/cadastrar_cliente/cadastrar_cliente.modal.dart';
import 'package:klenzer_app/ui/modals/cadastrar_funcionario/cadastrar_funcionario.modal.dart';
import 'package:klenzer_app/ui/modals/cadastrar_servico/cadastrar_servico.modal.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12, left: 10),
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: BlocProvider(
                    blocs: [
                      Bloc((i) => CadastrarClienteBloc()),
                    ],
                    tagText: 'CadastrarClienteBloc',
                    child: CadastrarClienteModal(),
                  ),
                  child: Text('Cadastrar Cliente'),
                ),
                PopupMenuItem(
                  value: BlocProvider(
                    blocs: [
                      Bloc((i) => CadastrarFuncionarioBloc()),
                    ],
                    tagText: 'CadastrarFuncionarioBloc',
                    child: CadastrarFuncionarioModal(),
                  ),
                  child: Text('Cadastrar Funcionario'),
                ),
                PopupMenuItem(
                  value: BlocProvider(
                    blocs: [
                      Bloc((i) => CadastrarServicoBloc()),
                    ],
                    tagText: 'CadastrarServicoBloc',
                    child: CadastrarServicoModal(),
                  ),
                  child: Text('Cadastrar Serviço'),
                ),
              ];
            },
            onSelected: (blocProvider) => openModal(
              context: context,
              bloc: blocProvider,
            ),
            child: Icon(
              Icons.menu,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'KLENZER',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Icon(Icons.menu, color: Colors.white),
      ],
    );
  }

  void openModal({
    @required BuildContext context,
    @required BlocProvider bloc,
  }) async {
    var success = await showDialog(
      context: context,
      builder: (BuildContext bc) {
        return bloc;
      },
    );

    if (success != null) {
      SnackBarLib.showSuccessSnackBar(
        context: context,
        text: 'Sucesso ao salvar!',
      );
    }
  }
}
