import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/saldo.dart';

class SaldoCard extends StatelessWidget {
  final Saldo saldo;

  const SaldoCard(this.saldo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Saldo', style: TextStyle(fontSize: 14, color: Colors.black54)),
        subtitle: Text('$saldo', style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

