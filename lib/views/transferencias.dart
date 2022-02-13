import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/item_transferencia.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:flutter_bytebank/views/formulario_transferencia.dart';

class Transferencias extends StatefulWidget {

  Transferencias({Key? key}) : super(key: key);

  @override
  State<Transferencias> createState() => _TransferenciasState();
}

class _TransferenciasState extends State<Transferencias> {
  final items = <Transferencia>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências'),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ItemTransferencia(items[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final Transferencia? transferencia = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia()));
          if (transferencia != null) setState(() => items.add(transferencia));
        },
      ),
    );
  }
}
