import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/extrato.dart' as extrato_model;
import 'package:provider/provider.dart';

class Extrato extends StatelessWidget {
  const Extrato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extrato')),
      body: Consumer<extrato_model.Extrato> (
        builder: (context, item, child) => Column(
          children: [
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Valor final: R\$ ' + item.valorFinal.toString()),
            )),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: item.transacoes.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text('R\$ ' + item.transacoes[index].valor.toString()),
                      subtitle: Text('Conta: ' + item.transacoes[index].numeroConta.toString()),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
