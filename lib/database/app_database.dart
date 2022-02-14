
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Future<Database> obterConexao() async {
    final String diretorio = await getDatabasesPath();
    final String fullpath = join(diretorio, 'bytebank.db');
    final conexao = await openDatabase(fullpath, onCreate: (db, versao) {
      db.execute('CREATE TABLE contatos (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, numero_conta INTEGER)');
      db.execute('CREATE TABLE transferencias (id INTEGER PRIMARY KEY AUTOINCREMENT, valor REAL, numero_conta INTEGER)');
    }, version: 1);
    return conexao;
  }


}