import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/cliente.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {

  const SaldoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Consumer<Cliente> (
          builder: (context, cliente, child) => Text('Olá${cliente.nome != null ? ' ' + cliente.nome!.split(' ')[0] : ''}, seu saldo é', style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ),
        subtitle: Consumer<Saldo> (
          builder: (context, saldo, child) => Text('$saldo', style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

