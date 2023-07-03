import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Normalmente, quantos litros de sangue uma pessoa tem? Em média, quantos são retirados numa doação de sangue?',
      'respostas': [
        {'texto': 'Tem entre 2 a 4 litros. São retirados 450 mililitros', 'pontuacao': 0},
        {'texto': 'Tem entre 4 a 6 litros. São retirados 450 mililitros', 'pontuacao': 10},
        {'texto': 'Tem 10 litros. São retirados 2 litros', 'pontuacao': 0},
        {'texto': 'Tem 7 litros. São retirados 1,5 litros', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'De quem é a famosa frase “Penso, logo existo”?',
      'respostas': [
        {'texto': 'Platão', 'pontuacao': 0},
        {'texto': 'Galileu Galilei', 'pontuacao': 0},
        {'texto': 'Descartes', 'pontuacao': 10},
        {'texto': 'Sócrates', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'De onde é a invenção do chuveiro elétrico?',
      'respostas': [
        {'texto': 'França', 'pontuacao': 0},
        {'texto': 'Inglaterra', 'pontuacao': 0},
        {'texto': 'Brasil', 'pontuacao': 10},
        {'texto': 'Austrália', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
