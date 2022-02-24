import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/extrato.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:flutter_bytebank/views/dashboard.dart';
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
    return const MaterialApp(
        home: Dashboard(),
    );
  }
}

