import 'package:flutter/material.dart';
import 'package:flutter_bytebank/database/app_database.dart';
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
      body: FutureBuilder<List>(
        future: obterContatos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final items = snapshot.data;
            if (items == null) return const Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(items[index]['nome'], style: const TextStyle(fontSize: 24)),
                  subtitle: Text(items[index]['numero_conta'].toString(), style: const TextStyle(fontSize: 16)),
                ),
              )
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

  Future<List> obterContatos() async {
    final db = await AppDatabase.obterConexao();
    return await db.query('contatos');
  }
}
