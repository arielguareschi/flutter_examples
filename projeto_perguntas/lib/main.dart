import 'package:flutter/material.dart';
import './resposta.dart';
import './resultado.dart';
import './questao.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": ['Coelho', 'Cobra', 'Elefante', 'Leao']
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": ['Maria', 'Joao', 'Leo', 'Pedro']
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Projeto Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Questao(
                        _perguntas[_perguntaSelecionada]['texto'].toString()),
                    ...respostas.map((e) => Resposta(e, _responder)).toList()
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
