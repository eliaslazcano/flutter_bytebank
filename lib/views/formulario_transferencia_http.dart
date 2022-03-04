import 'package:flutter/material.dart';

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
              onPressed: () => _criarTransferencia(context),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  _criarTransferencia(BuildContext context) async {
    // TODO - Implementar..
  }
}
