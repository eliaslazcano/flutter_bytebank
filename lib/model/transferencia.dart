class Transferencia {
  final int? id;
  final String? hashId;
  final double valor;
  final int numeroConta;

  Transferencia({this.id, this.hashId, required this.valor, required this.numeroConta});
  Transferencia.fromMap(Map<String, dynamic> map) : id = map['id'], valor = map['valor'], numeroConta = map['numero_conta'], hashId = null;
  Transferencia.fromJson(Map<String, dynamic> json) : hashId = json['id'], valor = json['value'], numeroConta = json['contact']['accountNumber'], id = null;

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, numeroConta: $numeroConta}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valor': valor,
      'numero_conta': numeroConta,
    };
  }

  Map<String, dynamic> toJson() => {
    'value': valor,
    'contact': {
      'name': 'ELIAS LAZCANO CASTRO NETO',
      'accountNumber': numeroConta
    }
  };
}