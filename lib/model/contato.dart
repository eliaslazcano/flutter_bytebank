class Contato {
  final int? id;
  final String nome;
  final int numeroConta;

  Contato({this.id, required this.nome, required this.numeroConta});

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numeroConta: $numeroConta}';
  }
}