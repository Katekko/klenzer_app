import 'package:klenzer_app/core/libs/rest.lib.dart';
import 'package:klenzer_app/core/models/horario.model.dart';
import 'package:klenzer_app/mocks/horarios.mock.dart';

class HorariosService {
  RestLib _rest = RestLib();

  void postMarcarHorario({HorarioModel horario}) async {
    try {
      // TODO: ADICIONAR O ENVIO PARA O SERVIDOR
      HorariosMock.salvarHorario(horario: horario);
    } catch (err) {
      rethrow;
    }
  }
}
