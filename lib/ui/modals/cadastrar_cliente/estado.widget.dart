import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';
import 'package:klenzer_app/core/models/estado.model.dart';

class EstadoWidget extends StatefulWidget {
  EstadoWidget({Key key}) : super(key: key);

  @override
  _EstadoWidgetState createState() => _EstadoWidgetState();
}

class _EstadoWidgetState extends State<EstadoWidget> {
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();


  String _valueDropDown;

  @override
  void initState() {
    super.initState();
    _valueDropDown = 'ES';
    _cadastrarClienteBloc.salvarEstado(estado: _valueDropDown);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7),
          child: Text(
            'Estado',
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),
        ),
        FutureBuilder<List<EstadoModel>>(
          future: _cadastrarClienteBloc.carregarEstados(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildDropDown(estados: snapshot.data);
            } else if (snapshot.hasError) {
              // TODO: falha ao carregar servicos
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Widget _buildDropDown({@required List<EstadoModel> estados}) {
    var dropDownItems = estados
        .map(
          (estado) =>
              _buildDropDownItem(label: estado.nome, sigla: estado.sigla),
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
      onChanged: (siglaEstado) {
        setState(() {
          _valueDropDown = siglaEstado;
          _cadastrarClienteBloc.salvarEstado(estado: siglaEstado);
        });
      },
    );
  }

  DropdownMenuItem _buildDropDownItem({
    @required String label,
    @required String sigla,
  }) {
    return DropdownMenuItem(
      value: sigla,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          label,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
