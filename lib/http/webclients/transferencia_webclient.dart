import 'dart:convert';
import 'package:flutter_bytebank/http/webclient.dart';
import 'package:flutter_bytebank/model/transferencia.dart';
import 'package:http/http.dart';

class TransferenciaWebClient {
  static Future<List<Transferencia>> listarTransferencias() async {
    final url = Uri.parse(baseUrl + '/transactions');
    final Response response = await client.get(url);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((json) => Transferencia.fromJson(json)).toList();
  }

  static Future<Transferencia> salvarTransferencia(Transferencia transferencia) async {
    final url = Uri.parse(baseUrl + '/transactions');
    final Response response = await client.post(url, headers:  {
      'Content-Type': 'application/json',
      'password': '1000',
    }, body: jsonEncode(transferencia.toJson()));

    Map<String, dynamic> responseData = jsonDecode(response.body);
    return Transferencia.fromJson(responseData);
  }
}