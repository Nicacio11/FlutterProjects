import 'package:flutter/cupertino.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.func,
  });

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) func;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'] as String,
              () => func(int.parse(resp['pontuacao'].toString())));
        }).toList()
      ],
    );
  }
}
