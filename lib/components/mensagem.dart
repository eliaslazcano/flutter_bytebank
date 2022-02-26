import 'package:flutter/material.dart';

exibirAlerta({required BuildContext context, required String content, String? titulo}) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(titulo ?? 'ATENÇÃO'),
    content: Text(content),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar'))
    ],
  ));
}