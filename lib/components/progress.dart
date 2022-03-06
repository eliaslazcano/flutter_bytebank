import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String? message;

  const Progress({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Visibility(
            child: Padding(padding: const EdgeInsets.only(top: 16), child: Text(message!, style: const TextStyle(fontSize: 16))),
            visible: message != null,
          )
        ],
      ),
    );
  }
}
