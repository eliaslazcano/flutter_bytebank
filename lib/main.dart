import 'package:flutter/material.dart';
import 'package:flutter_bytebank/views/transferencias.dart';

void main() => runApp(const BytebankApp());

//App Widget (root)
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Transferencias(),
    );
  }
}

