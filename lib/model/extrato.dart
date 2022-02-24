import 'package:flutter/material.dart';
import 'package:flutter_bytebank/model/transferencia.dart';

class Extrato extends ChangeNotifier {
  final _transacoes = <Transferencia>[];

  List<Transferencia> get transacoes => _transacoes;

  double get valorFinal => _transacoes.fold(0, (previousValue, element) => previousValue + element.valor);

  adiciona(Transferencia novaTransferencia) {
    _transacoes.add(novaTransferencia);
    notifyListeners();
  }
}