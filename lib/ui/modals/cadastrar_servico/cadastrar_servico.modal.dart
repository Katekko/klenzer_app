import 'package:flutter/material.dart';
import 'package:klenzer_app/core/libs/loading.lib.dart';

import 'form.widget.dart';
import 'header.widget.dart';

class CadastrarServicoModal extends StatefulWidget {
  @override
  _CadastrarServicoModalState createState() => _CadastrarServicoModalState();
}

class _CadastrarServicoModalState extends State<CadastrarServicoModal> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Dialog(
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
        ),
        LoadingWidget(),
      ],
    );
  }
}
