import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klenzer_app/core/services/auth.service.dart';
import 'package:klenzer_app/core/util/snackbar.lib.dart';
import 'package:pedantic/pedantic.dart';

import 'login_button.widget.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  GlobalKey<FormState> _formKey;
  AuthService _authService;

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _formKey = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _logar() async {
    try {
      if (_formKey.currentState.validate()) {
        unawaited(SystemChannels.textInput.invokeMethod('TextInput.hide'));
        
        await _authService.autenticar(
          password: _passwordController.text,
          login: _usernameController.text,
        );
        unawaited(Navigator.of(context).pushNamed('/home'));
      }
    } catch (err) {
      SnackBarLib.showErrorSnackBar(context: context, text: err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Digite seu login';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Seu login',
                focusColor: Colors.purple[400],
              ),
            ),
            TextFormField(
              controller: _passwordController,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Digite sua senha';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                onPressed: _logar,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
