import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function callBack;
  LoginButtonWidget({@required this.callBack});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => callBack(),
      color: Colors.purple[400],
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Enter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
