import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/item_transferencia.dart';
import 'package:flutter_bytebank/model/transferencia.dart';

class Transferencias extends StatelessWidget {
  const Transferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências'),),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(4000,8738)),
          ItemTransferencia(Transferencia(6000,3025)),
        ],
      ),
    );
  }
}
