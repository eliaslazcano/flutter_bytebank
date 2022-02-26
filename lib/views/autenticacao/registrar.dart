import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bytebank/components/mensagem.dart';

class Registrar extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controllerIptNome = TextEditingController();
  final TextEditingController _controllerIptEmail = TextEditingController();
  final TextEditingController _controllerIptCpf = TextEditingController();
  final TextEditingController _controllerIptCelular = TextEditingController();
  final TextEditingController _controllerIptNascimento = TextEditingController();
  final TextEditingController _controllerIptCep = TextEditingController();
  final TextEditingController _controllerIptEstado = TextEditingController();
  final TextEditingController _controllerIptCidade = TextEditingController();
  final TextEditingController _controllerIptBairro = TextEditingController();
  final TextEditingController _controllerIptLogradouro = TextEditingController();
  final TextEditingController _controllerIptNumero = TextEditingController();

  Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de cliente')),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _controllerIptNome,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  keyboardType: TextInputType.text,
                  maxLength: 255,
                  validator: (value) {
                    if (value!.isEmpty) return 'Informe pelo menos um sobrenome!';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerIptEmail,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 255,
                  validator: (value) {
                    if (value!.isEmpty) return 'Informe seu e-mail';
                    if (!value.contains('@') || !value.contains('.') || value.length < 3) return 'Informe um e-mail válido';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerIptCpf,
                  decoration: const InputDecoration(labelText: 'CPF'),
                  keyboardType: TextInputType.number,
                  maxLength: 14,
                  validator: (value) {
                    if (value!.isEmpty) return 'Informe o seu CPF';
                    if (value.length < 14) return 'Informe um CPF válido de 11 dígitos';
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) return 'Informe o seu número de celular';
                    if (value.length < 15) return 'Falta algum dígito';
                    return null;
                  },
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
                const SizedBox(height: 16),
                TextFormField(
                  controller: _controllerIptCep,
                  decoration: const InputDecoration(labelText: 'Cep'),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isEmpty) return 'Informe o seu CEP';
                    if (value.length < 10) return 'CEP inválido';
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter()
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
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      exibirAlerta(context: context, content: 'Em desenvolvimento');
                    }
                    else {
                      exibirAlerta(context: context, content: 'Existem campos inválidos');
                    }
                  },
                  child: const Text('Registrar')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
