import 'package:flutter/material.dart';
import 'package:flutter_bytebank/components/mensagem.dart';
import 'package:flutter_bytebank/model/cliente.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class Biometria extends StatelessWidget {
  final _localAuth = LocalAuthentication();

  Biometria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _biometriaDisponivel(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data == true) {
          return Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                const Text('Detectamos que você tem sensor biométrico no seu celular, deseja cadastrar acesso biométrico?'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await _autenticarCliente(context);
                  },
                  child: const Text('Habilitar biometria')
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<bool> _biometriaDisponivel() async {
    return await _localAuth.canCheckBiometrics;
  }

  Future<void> _autenticarCliente(BuildContext context) async {
    bool autenticado = await _localAuth.authenticate(
      localizedReason: 'Autentique-se para prosseguir',
      useErrorDialogs: true,
      biometricOnly: true,
      androidAuthStrings: const AndroidAuthMessages(
        signInTitle: 'Autenticação necessária',
        biometricHint: 'Verificação biométrica',
        cancelButton: 'Cancelar',
      ),
    );
    if (!autenticado) {
      exibirAlerta(context: context, content: 'Falha ao autenticar');
    } else {
      exibirAlerta(context: context, content: 'Autenticado com sucesso');
    }
    Cliente cliente = Provider.of<Cliente>(context);
    cliente.biometria = autenticado;
    cliente.atualizarProvider();
  }
}
