import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/contato.dart';
import 'package:flutter_bytebank/views/formulario_contato.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contatos extends StatefulWidget {

  const Contatos({Key? key}) : super(key: key);

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  List<dynamic> contatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos')),
      body: FutureBuilder<void>(
        future: loadContatos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (contatos.isEmpty) return const Center(child: Text('Nenhum contato encontrado'));
            return ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(contatos[index]['nome'], style: const TextStyle(fontSize: 24)),
                    subtitle: Text(contatos[index]['numeroConta'].toString(), style: const TextStyle(fontSize: 16)),
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
          final Contato? contato = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioContato()));
          if (contato != null) {
            contatos.add(contato);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('contatos', jsonEncode(contatos));
            setState(() {});
          }
        },
      ),
    );
  }

  Future<void> loadContatos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? contatosJson = prefs.getString('contatos');
    if (contatosJson == null) return;
    contatos = jsonDecode(contatosJson);
  }
}
