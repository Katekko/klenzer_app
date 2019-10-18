import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/marcar_horario.bloc.dart';
import 'package:klenzer_app/ui/modals/marcar_horario/marcar_horario.modal.dart';
import 'package:klenzer_app/ui/screens/home/app_bar.widget.dart';
import 'package:klenzer_app/ui/screens/home/calendario/calendario.widget.dart';

import 'header_empregado.widget.dart';
import 'time_line/time_line.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _marcarHorario() async {
      await showDialog(
        context: context,
        builder: (BuildContext bc) {
          return BlocProvider(
            blocs: [
              Bloc((i) => MarcarHorarioBloc()),
            ],
            tagText: 'MarcarHorarioBloc',
            child: MarcarHorarioModal(),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _marcarHorario(),
        backgroundColor: Color(0xFF070618),
        child: Icon(Icons.add, size: 30),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          AppBarWidget(),
          SizedBox(height: 20),
          HeaderEmpregadoWidget(),
          SizedBox(height: 20),
          CalendarioWidget(),
          Expanded(child: TimeLineWidget()),
        ],
      ),
    );
  }
}
