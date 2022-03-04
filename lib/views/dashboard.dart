import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/saldo_card.dart';
import 'package:flutter_bytebank/views/autenticacao/login.dart';
import 'package:flutter_bytebank/views/contatos.dart';
import 'package:flutter_bytebank/views/extrato.dart';
import 'package:flutter_bytebank/views/formulario_deposito.dart';
import 'package:flutter_bytebank/views/transferencias.dart';
import 'package:flutter_bytebank/views/transferencias_http.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4, right: 4, top: 4),
                child: SaldoCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/images/bytebank_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _botaoNavegar(context, 'Contatos', 'Chave-valor', Icons.people, () => const Contatos()),
                      _botaoNavegar(context, 'Transferências', 'SQLite', Icons.monetization_on, () => const Transferencias()),
                      _botaoNavegar(context, 'Transferências', 'HTTP', Icons.monetization_on, () => TransferenciasHttp()),
                      _botaoNavegar(context, 'Receber depósito', 'Provider', Icons.add_circle, () => FormularioDeposito()),
                      _botaoNavegar(context, 'Extrato', 'Provider', Icons.list_alt, () => const Extrato()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(36),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text('Sair'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _botaoNavegar(BuildContext context, String titulo, String subtitulo, IconData icone, [Function? view]) {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    Text(subtitulo, style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          onTap: () => view != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => view())) : null,
        ),
      ),
    );
  }
}
