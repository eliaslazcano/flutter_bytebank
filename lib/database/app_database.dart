
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static Future<Database> obterConexao() async {
    final String fullpath = join(await getDatabasesPath(), 'bytebank.db');
    final conexao = await openDatabase(fullpath, version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE contatos (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, numero_conta INTEGER)');
        db.execute('CREATE TABLE transferencias (id INTEGER PRIMARY KEY AUTOINCREMENT, valor REAL, numero_conta INTEGER)');
      }
    );
    return conexao;
  }


}