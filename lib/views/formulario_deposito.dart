import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:provider/provider.dart';

class FormularioDeposito extends StatelessWidget {
  final _controllerIptValor = TextEditingController();

  FormularioDeposito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receber depósito')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controllerIptValor,
                decoration: const InputDecoration(labelText: 'Valor', hintText: '0.00', icon: Icon(Icons.monetization_on)),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final double? valor = double.tryParse(_controllerIptValor.text);
                if (valor == null) {
                  const snackBar = SnackBar(content: Text('Valor inválido'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                Provider.of<Saldo>(context, listen: false).adiciona(valor);
                Navigator.pop(context);
              },
              child: const Text('Confirmar recebimento'),
            ),
          ],
        ),
      ),
    );
  }
}
