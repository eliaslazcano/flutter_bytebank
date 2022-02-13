import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/home_page/btn_acao.dart';
import 'package:flutter_bytebank/views/transferencias.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _botoesAcao(),
            ],
          ),
        ),
      ),
    );
  }

  _botoesAcao() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: const [
          BtnAcao(icone: Icons.monetization_on, titulo: 'Transferências', view: Transferencias(), primeiro: true),
        ]),
      ),
    );
  }
}
