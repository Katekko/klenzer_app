import 'package:flutter/material.dart';

class HeaderEmpregadoWidget extends StatelessWidget {
  const HeaderEmpregadoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 20),
        CircleAvatar(
          backgroundColor: Colors.redAccent,
        ),
        SizedBox(width: 20),
        Text(
          'Rodrigo Alacron Rodrigues',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
