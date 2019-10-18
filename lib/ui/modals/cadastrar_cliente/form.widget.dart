import 'package:flutter/material.dart';

import 'bairro.widget.dart';
import 'cidade.widget.dart';
import 'data.widget.dart';
import 'estado.widget.dart';
import 'instagram.widget.dart';
import 'nome.widget.dart';
import 'submit_button.widget.dart';

class FormWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                EstadoWidget(),
                CidadeWidget(),
                BairroWidget(),
                InstagramWidget(),
                SizedBox(height: 10),
                DataWidget(),
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
