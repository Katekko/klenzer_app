import 'package:flutter/material.dart';

import 'cliente.widget.dart';
import 'data.widget.dart';
import 'funcionario.widget.dart';
import 'servicos.widget.dart';
import 'submit_button.widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: DataWidget(),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: ClienteWidget(),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: ServicosWidget(),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              child: FuncionarioWidget(),
            ),
            SizedBox(height: 10),
            SubmitButton(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
