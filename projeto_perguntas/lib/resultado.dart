import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacao, this.reiniciarQuestionario, {super.key});

  final int pontuacao;
  final void Function() reiniciarQuestionario;

  String get resultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom de mais';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(resultado, style: const TextStyle(fontSize: 28))),
        ElevatedButton(onPressed: reiniciarQuestionario, child: const Text('Reiniciar'))
      ],
    );
  }
}
