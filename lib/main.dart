import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/extrato.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:flutter_bytebank/views/autenticacao/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    child: const BytebankApp(),
    providers: [
      ChangeNotifierProvider(create: (context) => Saldo(29.90)),
      ChangeNotifierProvider(create: (context) => Extrato()),
    ],
  ),
);

//App Widget (root)
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      home: Login(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt', 'BR')
      ],
    );
  }
}

