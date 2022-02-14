import 'package:flutter/material.dart';
import 'package:flutter_bytebank/database/dao/transferencia_dao.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:flutter_bytebank/views/formulario_transferencia.dart';

class Transferencias extends StatefulWidget {

  const Transferencias({Key? key}) : super(key: key);

  @override
  State<Transferencias> createState() => _TransferenciasState();
}

class _TransferenciasState extends State<Transferencias> {
  final items = <Transferencia>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências'),),
      body: FutureBuilder<List<Transferencia>>(
        future: TransferenciaDao().listar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final items = snapshot.data;
            if (items == null) return const Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final Transferencia transferencia = items[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.monetization_on, size: 40),
                    title: Text(transferencia.valor.toString()),
                    subtitle: Text(transferencia.numeroConta.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia()));
          setState(() {});
        },
      ),
    );
  }
}
