import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF070618),
        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[600])],
      ),
      child: Center(
        child: Text(
          'Cadastrar Funcionario',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
