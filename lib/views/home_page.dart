import 'package:flutter/material.dart';
import 'package:flutter_bytebank/views/contatos.dart';
import 'package:flutter_bytebank/views/transferencias.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _botaoNavegar(context, 'Contatos', Icons.people, () => const Contatos()),
                    _botaoNavegar(context, 'Transferências', Icons.monetization_on, () => const Transferencias()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _botaoNavegar(BuildContext context, String titulo, IconData icone, [Function? view]) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          child: Container(
            height: 100,
            width: 150,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icone, color: Colors.white, size: 24),
                Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
          onTap: () => view != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => view())) : null,
        ),
      ),
    );
  }
}
