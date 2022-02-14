import 'package:flutter/material.dart';
import 'package:flutter_bytebank/database/dao/contato_dao.dart';
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
      body: FutureBuilder<List<Contato>>(
        future: ContatoDao().listar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final items = snapshot.data;
            if (items == null) return const Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final Contato contato = items[index];
                return Card(
                  child: ListTile(
                    title: Text(contato.nome, style: const TextStyle(fontSize: 24)),
                    subtitle: Text(contato.numeroConta.toString(), style: const TextStyle(fontSize: 16)),
                  ),
                );
              }
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioContato()));
          setState(() {});
        },
      ),
    );
  }
}
