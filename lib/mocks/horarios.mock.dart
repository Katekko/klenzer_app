import 'package:flutter/foundation.dart';
import 'package:klenzer_app/core/models/horario.model.dart';

class HorariosMock {
  static List<HorarioModel> horarios = List();
  static void salvarHorario({@required HorarioModel horario}) {
    horarios.add(horario);
  }
}
