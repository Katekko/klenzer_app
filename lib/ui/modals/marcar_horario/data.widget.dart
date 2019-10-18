import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';
import 'package:klenzer_app/core/util/snackbar.lib.dart';

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
          padding: EdgeInsets.only(top: 7, left: 7),
          child: Text('Dia e Hora'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('De'),
            _DataForm(firstDate: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Até'),
            _DataForm(firstDate: false),
          ],
        ),
      ],
    );
  }
}

class _DataForm extends StatefulWidget {
  final bool firstDate;
  final MarcarHorarioBloc marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();
  _DataForm({@required this.firstDate});
  @override
  __DataFormState createState() => __DataFormState();
}

class __DataFormState extends State<_DataForm> {
  DateTime _diaEscolhido;
  String _date;
  String _hour;

  @override
  void initState() {
    super.initState();
    _diaEscolhido = DateTime.now();
    _formatDateHour();
  }

  void _formatDateHour() {
    setState(() {
      _date = DateFormat.yMd().format(_diaEscolhido);
      _hour = DateFormat.Hm().format(_diaEscolhido);
    });
  }

  void _abrirCalendario() async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onConfirm: (_date) {
        if (_date.isAfter(DateTime.now())) {
          setState(() {
            _diaEscolhido = _date;
            _formatDateHour();
            this.widget.marcarHorarioBloc.salvarData(
                  data: _diaEscolhido,
                  firstDate: this.widget.firstDate,
                );
          });
        } else {
          SnackBarLib.showErrorSnackBar(
            context: context,
            text: 'Marque uma data futura!',
          );
        }
      },
      currentTime: _diaEscolhido,
      locale: LocaleType.pt,
    );
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
        Text(
          '$_hour',
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: () => _abrirCalendario(),
          icon: Icon(Icons.calendar_today),
        )
      ],
    );
  }
}
