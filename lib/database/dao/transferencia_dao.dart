import 'package:flutter_bytebank/database/app_database.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:sqflite/sqflite.dart';

class TransferenciaDao {
  final String _tabela = 'transferencias';
  final Database? db;

  TransferenciaDao([this.db]);

  Future<int> inserir(Transferencia item) async {
    final Database db = this.db ?? await AppDatabase.obterConexao();
    return await db.insert(_tabela, item.toMap());
  }

  Future<void> deletar(int id) async {
    final Database db = this.db ?? await AppDatabase.obterConexao();
    await db.delete(_tabela, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> atualizar(Transferencia item) async {
    if (item.id == null) return;
    final Database db = this.db ?? await AppDatabase.obterConexao();
    await db.update(_tabela, item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<List<Transferencia>> listar() async {
    final Database db = this.db ?? await AppDatabase.obterConexao();
    final List<Map<String, dynamic>> maps = await db.query(_tabela);
    return List.generate(maps.length, (i) => Transferencia.fromMap(maps[i]));
  }
}