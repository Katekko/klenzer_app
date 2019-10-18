import 'package:flutter/material.dart';
import 'package:klenzer_app/ui/modals/cadastrar_funcionario/cargo.widget.dart';

import 'nome.widget.dart';
import 'submit_button.widget.dart';

class FormWidget extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 13, right: 13),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                NomeWidget(),
                SizedBox(height: 10),
                CargoWidget(),
                SizedBox(height: 10),
                SubmitButton(formKey: _formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
