import 'package:flutter/material.dart';
import 'package:klenzer_app/ui/modals/marcar_horario/form.widget.dart';

import 'header.widget.dart';

class MarcarHorarioModal extends StatelessWidget {
  const MarcarHorarioModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(flex: 7, child: FormWidget()),
          Flexible(child: HeaderWidget()),
        ],
      ),
    );
  }
}
