import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/contato.dart';
import 'package:flutter_bytebank/views/formulario_contato.dart';

class Contatos extends StatefulWidget {

  const Contatos({Key? key}) : super(key: key);

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final items = <Contato>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(items[index].nome, style: const TextStyle(fontSize: 24)),
            subtitle: Text(items[index].numeroConta.toString(),  style: const TextStyle(fontSize: 16)),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final Contato? contato = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioContato()));
          if (contato != null) setState(() => items.add(contato));
        },
      ),
    );
  }
}
