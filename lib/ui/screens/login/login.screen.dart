import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:klenzer_app/core/libs/loading.lib.dart';

import 'login_form.widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Container(
                      // TODO: melhorar a imagem depois
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image(
                        image: AssetImage('assets/images/klenzer-logo.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: FormWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
        LoadingWidget(),
      ],
    );
  }
}
