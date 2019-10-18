import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klenzer_app/core/blocs/cadastrar_cliente.bloc.dart';

class DataWidget extends StatefulWidget {
  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 13),
          child: Text(
            'Aniversario',
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),
        ),
        _DataForm(),
      ],
    );
  }
}

class _DataForm extends StatefulWidget {
  @override
  __DataFormState createState() => __DataFormState();
}

class __DataFormState extends State<_DataForm> {
  final CadastrarClienteBloc _cadastrarClienteBloc =
      BlocProvider.tag('CadastrarClienteBloc').getBloc<CadastrarClienteBloc>();

  String _date;

  @override
  void initState() {
    super.initState();
    _formatDateHour(date: DateTime.now());
  }

  void _formatDateHour({DateTime date}) {
    setState(() {
      _date = DateFormat('MM/yyyy').format(date);
    });
  }

  void _abrirCalendario() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 999999)),
      lastDate: DateTime.now(),
    );

    _formatDateHour(date: date);
    _cadastrarClienteBloc.salvarData(date: date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '$_date',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 20),
        IconButton(
          onPressed: () => _abrirCalendario(),
          icon: Icon(Icons.calendar_today),
        )
      ],
    );
  }
}
