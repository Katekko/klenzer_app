import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';
import 'package:klenzer_app/core/models/cliente.model.dart';

class ClienteWidget extends StatefulWidget {
  ClienteWidget({Key key}) : super(key: key);

  @override
  _ClienteWidgetState createState() => _ClienteWidgetState();
}

class _ClienteWidgetState extends State<ClienteWidget> {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  int _valueDropDown;

  @override
  void initState() {
    super.initState();
    _valueDropDown = -1;
    _marcarHorarioBloc.carregarClientesExistentes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7, left: 7, bottom: 5),
          child: Text('Clientes'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: StreamBuilder<List<ClienteModel>>(
            stream: _marcarHorarioBloc.clientesExistentesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildDropDown(clientes: snapshot.data);
              } else if (snapshot.hasError) {
                // TODO: falha ao carregar clientes
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropDown({@required List<ClienteModel> clientes}) {
    var dropDownItems = clientes
        .map(
          (cliente) => _buildDropDownItem(label: cliente.nome, id: cliente.id),
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
      onChanged: (clienteId) {
        setState(() {
          _valueDropDown = clienteId;
          _marcarHorarioBloc.atualizarClienteAtualDropDown(
            cliente: _marcarHorarioBloc.clientesExistentes.firstWhere(
              (cliente) => cliente.id == clienteId,
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
