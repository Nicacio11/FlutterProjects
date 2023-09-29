import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.texto, this.onSelecao, {super.key});
  
  final String texto;
  final void Function() onSelecao;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: onSelecao,
        child: Text(texto),
      ),
    );
  }
}
