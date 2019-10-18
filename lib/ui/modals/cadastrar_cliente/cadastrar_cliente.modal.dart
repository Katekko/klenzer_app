import 'package:flutter/material.dart';
import 'package:klenzer_app/core/libs/loading.lib.dart';

import 'form.widget.dart';
import 'header.widget.dart';

class CadastrarClienteModal extends StatefulWidget {
  CadastrarClienteModal({Key key}) : super(key: key);

  @override
  _CadastrarClienteModalState createState() => _CadastrarClienteModalState();
}

class _CadastrarClienteModalState extends State<CadastrarClienteModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(flex: 5, child: FormWidget()),
          Flexible(child: HeaderWidget()),
        ],
      ),
    );
  }
}
