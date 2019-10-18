import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:klenzer_app/core/blocs/loading.bloc.dart';
import 'package:klenzer_app/ui/screens/home/home_screen.dart';
import 'package:klenzer_app/ui/screens/login/login.screen.dart';

enum _RouteErrorType {
  inexistentRoute,
  argumentTypeWrong,
}

class NavigationLib {
  static Route<dynamic> gerarRotas(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return _errorHandler(
          error: _RouteErrorType.inexistentRoute,
          received: settings.name,
        );
    }
  }

  static Route<dynamic> _errorHandler({
    _RouteErrorType error,
    String expectedValue = '!!!Define a expected value!!!',
    dynamic received = '!!!Pass the value received!!!',
  }) {
    MaterialPageRoute _pageErro({
      @required String title,
      @required String bodyText,
    }) {
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Klenzer Error'),
            backgroundColor: Colors.purple[400],
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
        );
      });
    }

    switch (error) {
      case _RouteErrorType.argumentTypeWrong:
        return _pageErro(
          title: 'Argument Error',
          bodyText:
              'Error while passing value to a new route, expected $expectedValue and received $received',
        );
        break;
      case _RouteErrorType.inexistentRoute:
        return _pageErro(
          title: 'Route not found',
          bodyText: 'This route that you passed don\'t exist! Route: $received',
        );
        break;
      default:
        return _pageErro(
          title: 'Mysterious Error',
          bodyText: 'Mysterious error while navigating to another screen!',
        );
        break;
    }
  }
}
