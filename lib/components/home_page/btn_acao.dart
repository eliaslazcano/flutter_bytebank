import 'package:flutter/material.dart';
import 'package:flutter_bytebank/views/transferencias.dart';

class BtnAcao extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final bool primeiro;
  final Widget view;

  const BtnAcao({Key? key, required this.icone, required this.titulo, required this.view, this.primeiro = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: primeiro ? const EdgeInsets.only(left: 20, right: 6) : const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => view)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 241, 245, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(icone),
            ),
            Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
