class Contato {
  final int? id;
  final String nome;
  final int numeroConta;

  Contato({this.id, required this.nome, required this.numeroConta});

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numeroConta: $numeroConta}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'numero_conta': numeroConta,
    };
  }

  static Contato fromMap(Map<String, dynamic> map) {
    return Contato(id: map['id'], nome: map['nome'], numeroConta: map['numero_conta']);
  }
}