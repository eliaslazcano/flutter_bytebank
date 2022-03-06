import 'package:flutter/material.dart';
import 'package:flutter_bytebank/http/webclients/transferencia_webclient.dart';
import 'package:flutter_bytebank/model/transferencia.dart';

class FormularioTransferenciaHttp extends StatelessWidget {
  final _controllerIptNumeroConta = TextEditingController();
  final _controllerIptValor = TextEditingController();

  FormularioTransferenciaHttp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controllerIptNumeroConta,
                decoration: const InputDecoration(labelText: 'Número da conta', hintText: '0000'),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
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
              onPressed: () => _salvarTransferencia(context),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  _salvarTransferencia(BuildContext context) async {
    final int? numeroConta = int.tryParse(_controllerIptNumeroConta.text);
    final double? valor = double.tryParse(_controllerIptValor.text);
    if (numeroConta == null || valor == null) {
      const snackBar = SnackBar(content: Text('Um ou mais dados inválidos'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final transferencia = Transferencia(valor: valor, numeroConta: numeroConta);

    TransferenciaWebClient.salvarTransferencia(transferencia);
    Navigator.pop(context);
  }
}
