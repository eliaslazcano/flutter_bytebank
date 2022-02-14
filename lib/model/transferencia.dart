class Transferencia {
  final int? id;
  final double valor;
  final int numeroConta;

  Transferencia({this.id, required this.valor, required this.numeroConta});

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, numeroConta: $numeroConta}';
  }
}