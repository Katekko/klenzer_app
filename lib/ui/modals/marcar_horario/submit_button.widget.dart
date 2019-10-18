import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';

class SubmitButton extends StatelessWidget {
  final MarcarHorarioBloc _marcarHorarioBloc =
      BlocProvider.tag('MarcarHorarioBloc').getBloc<MarcarHorarioBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () => _marcarHorarioBloc.marcarHorario(),
        color: Color(0xFF070618),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Marcar Horario',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
