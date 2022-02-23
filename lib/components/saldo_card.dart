import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:provider/provider.dart';

class SaldoCard extends StatelessWidget {

  const SaldoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Saldo', style: TextStyle(fontSize: 14, color: Colors.black54)),
        subtitle: Consumer<Saldo> (
          builder: (context, saldo, child) => Text('$saldo', style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

