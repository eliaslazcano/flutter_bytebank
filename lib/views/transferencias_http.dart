import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/centered_message.dart';
import 'package:flutter_bytebank/components/progress.dart';
import 'package:flutter_bytebank/http/webclients/transferencia_webclient.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:flutter_bytebank/views/formulario_transferencia_http.dart';

class TransferenciasHttp extends StatelessWidget {

  const TransferenciasHttp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: FutureBuilder<List<Transferencia>>(
        future: Future.delayed(const Duration(seconds: 1)).then((value) => TransferenciaWebClient.listarTransferencias()),
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done) {
            return const Progress(message: 'Obtendo transferências');
          }
          else {
            final transferencias = snapshot.data;
            if(transferencias == null) return const CenteredMessage('Sem conexão', icon: Icons.signal_cellular_connected_no_internet_4_bar);
            if(transferencias.isEmpty) return const CenteredMessage('Nenhuma transferência', icon: Icons.warning);
            return ListView.builder(
              itemCount: transferencias.length,
              itemBuilder: (context, index) {
                final Transferencia transferencia = transferencias[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.monetization_on, size: 40),
                    title: Text('R\$ ' + transferencia.valor.toString()),
                    subtitle: Text('conta: ' + transferencia.numeroConta.toString() + '\n' + 'id: ${transferencia.hashId}'),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferenciaHttp()));
        },
      ),
    );
  }
}
