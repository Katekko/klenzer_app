import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';
import 'package:klenzer_app/core/models/funcionario.model.dart';

class FuncionarioWidget extends StatefulWidget {
  FuncionarioWidget({Key key}) : super(key: key);

  @override
  _FuncionarioWidgetState createState() => _FuncionarioWidgetState();
}

class _FuncionarioWidgetState extends State<FuncionarioWidget> {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  int _valueDropDown;

  @override
  void initState() {
    super.initState();
    _valueDropDown = -1;
    _marcarHorarioBloc.carregarFuncionariosExistentes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7, left: 7, bottom: 5),
          child: Text('Funcionarios'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: StreamBuilder<List<FuncionarioModel>>(
            stream: _marcarHorarioBloc.funcionariosExistentesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildDropDown(funcionarios: snapshot.data);
              } else if (snapshot.hasError) {
                // TODO: falha ao carregar servicos
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropDown({@required List<FuncionarioModel> funcionarios}) {
    var dropDownItems = funcionarios
        .map(
          (funcionario) =>
              _buildDropDownItem(label: funcionario.nome, id: funcionario.id),
        )
        .toList();

    return DropdownButton(
      value: _valueDropDown,
      isExpanded: true,
      underline: Container(
        height: 1,
        color: Colors.grey[400],
      ),
      items: dropDownItems,
      onChanged: (funcionarioId) {
        setState(() {
          _valueDropDown = funcionarioId;
          _marcarHorarioBloc.atualizarFuncionarioAtualDropDown(
            funcionario: _marcarHorarioBloc.funcionariosExistentes.firstWhere(
              (funcionario) => funcionario.id == funcionarioId,
            ),
          );
        });
      },
    );
  }

  DropdownMenuItem _buildDropDownItem({
    @required String label,
    @required int id,
  }) {
    return DropdownMenuItem(
      value: id,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          label,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
