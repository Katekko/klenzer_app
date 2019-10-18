import 'package:flutter/material.dart';
import 'package:klenzer_app/core/libs/loading.lib.dart';

import 'form.widget.dart';
import 'header.widget.dart';

class CadastrarFuncionarioModal extends StatefulWidget {
  @override
  _CadastrarFuncionarioModalState createState() =>
      _CadastrarFuncionarioModalState();
}

class _CadastrarFuncionarioModalState extends State<CadastrarFuncionarioModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .48,
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(flex: 3, child: FormWidget()),
            Flexible(child: HeaderWidget()),
          ],
        ),
      ),
    );
  }
}
