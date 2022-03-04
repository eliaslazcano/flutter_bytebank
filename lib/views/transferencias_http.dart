import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/transferencia.dart';

class TransferenciasHttp extends StatelessWidget {
  final _transferencias = <Transferencia>[];

  TransferenciasHttp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {
          final Transferencia transferencia = _transferencias[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.monetization_on, size: 40),
              title: Text(transferencia.valor.toString()),
              subtitle: Text(transferencia.numeroConta.toString()),
            ),
          );
        },
      ),
    );
  }
}
