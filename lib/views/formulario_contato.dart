import 'package:flutter/material.dart';
import 'package:flutter_bytebank/database/app_database.dart';
import 'package:flutter_bytebank/model/contato.dart';

class FormularioContato extends StatelessWidget {
  final _controllerIptNome = TextEditingController();
  final _controllerIptNumeroConta = TextEditingController();

  FormularioContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo contato')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controllerIptNome,
                decoration: const InputDecoration(labelText: 'Nome'),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controllerIptNumeroConta,
                decoration: const InputDecoration(labelText: 'Número da conta'),
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => _criarContato(context),
                child: const Text('Confirmar', style: TextStyle(fontSize: 24)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _criarContato(BuildContext context) async {
    final String nome = _controllerIptNome.text;
    final int? numeroConta = int.tryParse(_controllerIptNumeroConta.text);
    if (nome.trim().isEmpty || numeroConta == null) {
      const snackBar = SnackBar(content: Text('Um ou mais dados inválidos'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    //Adicionando no banco
    final contatoObj = {'nome': nome, 'numero_conta': numeroConta};
    final db = await AppDatabase.obterConexao();
    await db.insert('contatos', contatoObj);
    db.close();

    Navigator.pop(context);
  }
}
