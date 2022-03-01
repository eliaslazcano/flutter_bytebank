import 'dart:io';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bytebank/model/cliente.dart';
import 'package:flutter_bytebank/views/dashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';

class Registrar extends StatelessWidget {

  //Step 1
  final _formUserData = GlobalKey<FormState>();
  final TextEditingController _controllerIptNome = TextEditingController();
  final TextEditingController _controllerIptEmail = TextEditingController();
  final TextEditingController _controllerIptCpf = TextEditingController();
  final TextEditingController _controllerIptCelular = TextEditingController();
  final TextEditingController _controllerIptNascimento = TextEditingController();

  //Step 2
  final _formUserAddress = GlobalKey<FormState>();
  final TextEditingController _controllerIptCep = TextEditingController();
  final TextEditingController _controllerIptEstado = TextEditingController();
  final TextEditingController _controllerIptCidade = TextEditingController();
  final TextEditingController _controllerIptBairro = TextEditingController();
  final TextEditingController _controllerIptLogradouro = TextEditingController();
  final TextEditingController _controllerIptNumero = TextEditingController();

  //Step 3
  final _formUserAuth = GlobalKey<FormState>();
  final TextEditingController _controllerIptSenha = TextEditingController();
  final TextEditingController _controllerIptConfirmarSenha = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de cliente')),
      body: Consumer<Cliente>(
        builder: (context, cliente, child) => Stepper(
          currentStep: cliente.etapaAtual,
          onStepContinue: () => _continuar(cliente, context),
          onStepCancel: () => _cancelar(cliente, context),
          steps: _construirSteps(cliente),
          controlsBuilder: _construirBotoes,
        )
      ),
    );
  }

  List<Step> _construirSteps(Cliente cliente) => <Step>[
    Step(
      title: const Text('Seus dados'),
      isActive: cliente.etapaAtual >= 0,
      content: Form(
        key: _formUserData,
        child: Column(
          children: [
            TextFormField(
              controller: _controllerIptNome,
              decoration: const InputDecoration(labelText: 'Nome'),
              keyboardType: TextInputType.text,
              maxLength: 255,
              validator: (value) {
                if (value!.isEmpty) return 'Informe seu nome';
                if (value.split(' ').length < 2) return 'Informe pelo menos um sobrenome';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerIptEmail,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              maxLength: 255,
              validator: (value) => Validator.email(value) ? 'E-mail inválido' : null,
            ),
            TextFormField(
              controller: _controllerIptCpf,
              decoration: const InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
              maxLength: 14,
              validator: (value) => Validator.cpf(value) ? 'CPF inválido' : null,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
            ),
            TextFormField(
              controller: _controllerIptCelular,
              decoration: const InputDecoration(labelText: 'Celular'),
              keyboardType: TextInputType.number,
              maxLength: 15,
              validator: (value) => Validator.phone(value) ? 'Celular inválido' : null,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
            ),
            DateTimePicker(
              controller: _controllerIptNascimento,
              type: DateTimePickerType.date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Nascimento',
              dateMask: 'dd/MM/yyyy',
              validator: (value) {
                if (value!.isEmpty) return 'Informe a data de nascimento';
                return null;
              },
            ),
          ],
        ),
      ),
    ),
    Step(
      title: const Text('Endereço'),
      isActive: cliente.etapaAtual >= 1,
      content: Form(
        key: _formUserAddress,
        child: Column(
          children: [
            TextFormField(
              controller: _controllerIptCep,
              decoration: const InputDecoration(labelText: 'Cep'),
              keyboardType: TextInputType.number,
              maxLength: 10,
              validator: (value) => Validator.cep(value) ? 'CEP inválido' : null,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(ponto: false)
              ],
            ),
            DropdownButtonFormField(
              items: Estados.listaEstadosSigla.map((String uf) => DropdownMenuItem(child: Text(uf), value: uf)).toList(),
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Estado'),
              onChanged: (String? value) => _controllerIptEstado.text = value!,
              validator: (value) {
                if (value == null) return 'Selecione o estado do endereço';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controllerIptCidade,
              decoration: const InputDecoration(labelText: 'Cidade'),
              maxLength: 255,
              validator: (value) {
                if (value!.isEmpty) return 'Informe a cidade do seu endereço';
                if (value.length < 3) return 'Cidade inválida';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerIptBairro,
              decoration: const InputDecoration(labelText: 'Bairro'),
              maxLength: 255,
              validator: (value) {
                if (value!.isEmpty) return 'Informe o bairro do seu endereço';
                if (value.length < 3) return 'Bairro inválido';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerIptLogradouro,
              decoration: const InputDecoration(labelText: 'Logradouro'),
              maxLength: 255,
              validator: (value) {
                if (value!.isEmpty) return 'Informe o logradouro do seu endereço';
                if (value.length < 3) return 'Logradouro inválido';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerIptNumero,
              decoration: const InputDecoration(labelText: 'Número'),
              maxLength: 255,
            ),
          ],
        ),
      ),
    ),
    Step(
      title: const Text('Autenticação'),
      isActive: cliente.etapaAtual >= 2,
      content: Form(
        key: _formUserAuth,
        child: Column(
          children: [
            TextFormField(
              controller: _controllerIptSenha,
              decoration: const InputDecoration(labelText: 'Senha'),
              maxLength: 15,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) return 'Informe a sua nova senha';
                if (value.length < 8) return 'Senha muito curta';
                return null;
              },
            ),
            TextFormField(
              controller: _controllerIptConfirmarSenha,
              decoration: const InputDecoration(labelText: 'Confirmar'),
              maxLength: 15,
              obscureText: true,
              validator: (value) {
                if (value != _controllerIptSenha.text) return 'Este campo está diferente da senha informada';
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text('Para prosseguir com seu cadastro é necessário que tenhamos uma foto do seu RG'),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Tirar foto do meu RG'),
                  onPressed: () => _capturarRg(cliente),
                ),
              ],
            ),
            _jaEnviouRg(cliente) ? _imagemDoRg(cliente) : _pedidoDeRg(),
          ],
        ),
      ),
    ),
  ];

  Widget _construirBotoes(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('CONTINUAR')
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: details.onStepCancel,
            child: const Text('VOLTAR'),
            style: ElevatedButton.styleFrom(primary: Colors.black),
          ),
        ],
      ),
    );
  }

  void _continuar(Cliente cliente, context) {
    final funcoes = [_salvarStep1, _salvarStep2, _salvarStep3];
    funcoes[cliente.etapaAtual](cliente, context);
  }
  void _cancelar(Cliente cliente, context) {
    if (cliente.etapaAtual > 0) {
      cliente.etapaAtual--;
      cliente.atualizarProvider();
    } else {
      Navigator.pop(context);
    }
  }

  void _salvarStep1(Cliente cliente, context) {
    if (_formUserData.currentState!.validate()) {
      cliente.nome = _controllerIptNome.text;
      cliente.email = _controllerIptEmail.text;
      cliente.cpf = _controllerIptCpf.text;
      cliente.celular = _controllerIptCelular.text;
      cliente.nascimento = _controllerIptNascimento.text;
      cliente.etapaAtual++;
      cliente.atualizarProvider();
    }
  }
  void _salvarStep2(Cliente cliente, context) {
    if (_formUserAddress.currentState!.validate()) {
      cliente.cep = _controllerIptCep.text;
      cliente.estado = _controllerIptEstado.text;
      cliente.cidade = _controllerIptCidade.text;
      cliente.bairro = _controllerIptBairro.text;
      cliente.logradouro = _controllerIptLogradouro.text;
      cliente.numero = _controllerIptNumero.text;
      cliente.etapaAtual++;
      cliente.atualizarProvider();
    }
  }
  void _salvarStep3(Cliente cliente, context) {
    if (_formUserAuth.currentState!.validate() && cliente.imagemRg != null) {
      FocusScope.of(context).unfocus(); // tira o foco para ocasionar o fechamento do teclsdo
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Dashboard()), (route) => false);
      cliente.etapaAtual = 0;
    }
  }

  Future<void> _capturarRg(Cliente cliente) async {
    final XFile? foto = await _picker.pickImage(source: ImageSource.camera);
    if (foto != null) {
      cliente.imagemRg = File(foto.path);
      cliente.atualizarProvider();
    }
  }
  bool _jaEnviouRg(Cliente cliente) {
    return cliente.imagemRg != null;
  }
  Widget _imagemDoRg(Cliente cliente) {
    return Image.file(cliente.imagemRg ?? File(''));
  }
  Widget _pedidoDeRg() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Text('Foto de RG pendente!', style: TextStyle(color: Colors.red, fontSize: 16))
      ],
    );
  }
}
