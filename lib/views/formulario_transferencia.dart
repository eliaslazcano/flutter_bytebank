import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  final _controllerIptNumeroConta = TextEditingController();
  final _controllerIptValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova transferência')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _controllerIptNumeroConta,
              decoration: InputDecoration(labelText: 'Número da conta', hintText: '0000'),
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _controllerIptValor,
              decoration: InputDecoration(labelText: 'Valor', hintText: '0.00', icon: Icon(Icons.monetization_on)),
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () => _criarTransferencia(context),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerIptNumeroConta.text);
    final double? valor = double.tryParse(_controllerIptValor.text);
    if (numeroConta == null || valor == null) {
      const snackBar = SnackBar(
        content: Text('Um ou mais dados inválidos'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final transferencia = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferencia);
  }
}
