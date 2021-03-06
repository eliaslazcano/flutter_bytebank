import 'package:flutter/material.dart';
import 'package:flutter_bytebank/database/dao/transferencia_dao.dart';
import 'package:flutter_bytebank/model/extrato.dart';
import 'package:flutter_bytebank/model/saldo.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:provider/provider.dart';

class FormularioTransferencia extends StatelessWidget {
  final _controllerIptNumeroConta = TextEditingController();
  final _controllerIptValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

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

  Future<void> _criarTransferencia(BuildContext context) async {
    final int? numeroConta = int.tryParse(_controllerIptNumeroConta.text);
    final double? valor = double.tryParse(_controllerIptValor.text);
    if (numeroConta == null || valor == null) {
      const snackBar = SnackBar(content: Text('Um ou mais dados inválidos'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    //Adicionando no banco
    final transferencia = Transferencia(valor: valor, numeroConta: numeroConta);
    await TransferenciaDao().inserir(transferencia);
    Provider.of<Extrato>(context, listen: false).adiciona(Transferencia(valor: -valor, numeroConta: numeroConta));
    Provider.of<Saldo>(context, listen: false).subtrair(transferencia.valor);
    Navigator.pop(context);
  }
}
