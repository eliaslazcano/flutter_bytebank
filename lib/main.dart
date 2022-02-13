import 'package:flutter/material.dart';
import 'package:flutter_bytebank/views/home_page.dart';

void main() => runApp(const BytebankApp());

//App Widget (root)
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: HomePage(),
    );
  }
}

