import 'dart:io';
import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier {
  int etapaAtual = 0;
  String? nome;
  String? email;
  String? cpf;
  String? celular;
  String? nascimento;

  String? cep;
  String? estado;
  String? cidade;
  String? bairro;
  String? logradouro;
  String? numero;

  File? imagemRg;

  bool biometria = false;

  void atualizarProvider() => notifyListeners();
}