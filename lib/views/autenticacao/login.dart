import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bytebank/views/autenticacao/registrar.dart';
import 'package:flutter_bytebank/views/dashboard.dart';

class Login extends StatelessWidget {
  final TextEditingController _controllerIptCpf = TextEditingController();
  final TextEditingController _controllerIptSenha = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Imagem de Logo:
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/bytebank_logo_mini.png', width: 200),
              ),
              //Espacamento
              const SizedBox(height: 20),
              //Container de login
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  width: 300,
                  height: 440,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: _construirFormulario(context),
                  ),
                ),
              ),
              //Espacamento
            ],
          ),
        ),
      ),
    );
  }

  bool _validaCampos() {
    if (_controllerIptCpf.text.isEmpty || _controllerIptSenha.text.isEmpty) return false;
    return true;
  }

  Widget _construirFormulario(context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const Text('Faça seu Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'CPF'),
            maxLength: 14,
            keyboardType: TextInputType.number,
            controller: _controllerIptCpf,
            validator: (value) {
              if (value!.isEmpty) return 'Informe o CPF';
              if (value.length < 14) return 'CPF inválido';
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Senha'),
            maxLength: 15,
            keyboardType: TextInputType.text,
            controller: _controllerIptSenha,
            validator: (value) {
              if (value!.isEmpty) return 'Informe a senha';
              return null;
            },
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(36),
              side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
            ),
            child: const Text('CONTINUAR'),
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Dashboard()), (route) => false);
              }
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Esqueci minha senha >',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: const Size.fromHeight(32),
              side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
            ),
            child: const Text('Criar uma conta >', style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Registrar())),
          ),
        ],
      ),
    );
  }
}
