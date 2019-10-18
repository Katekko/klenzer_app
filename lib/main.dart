import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:klenzer_app/core/libs/navigation.lib.dart';

void main() {
  return runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: NavigationLib.gerarRotas,
      supportedLocales: [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    ),
  );
}

// TODOS:
// Feito o login e o token salvo e agora precisa manter o cara logado
// Fazer o loading na tela ao logar

// adicionar campo de valor do serviço
// o valor é modificado de acordo com os serviços adicionados
// sempre somo o valor dos serviços + o valor escrito no campo
// agora preciso fazer a validação da marcação bem como fazer sair da tela caso aconteça a marcação.

// 2. Depois de marcado o horario preciso colocar o horario marcado na tela principal

// 6. Toques finais, arrumar o cabeçario na tela principal

// 7. Montar a parte de restfull para começar a consumir a API

// 8. Fazer o login utilizando apenas o login do admin já pré cadastrado

// 9. Usar o token do login para fazer as proximas requisições

// 10. Colocar todos os mocks para utilizaram os dados da API
