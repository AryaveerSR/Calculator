import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '+/-',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '%',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle(fontSize: 32, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 30, right: 20, left: 20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 16),
                    ),
                  ),
                ]),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    onClick: () {
                      final btn = buttons[index];
                      if (btn == "C") {
                        setState(() {
                          userInput = '';
                          answer = '';
                          calcEqual();
                        });
                      } else if (btn == "DEL") {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          calcEqual();
                        });
                      } else if (btn == "=") {
                        setState(() {
                          calcEqual();
                        });
                      } else if (btn == "+/-") {
                        // Cough. Cough. Cough.
                      } else {
                        setState(() {
                          userInput += btn;
                          calcEqual();
                        });
                      }
                    },
                    tier: getTier(index),
                    buttonText: buttons[index],
                  );
                }),
          ),
        ],
      ),
    );
  }

  ButtonTier getTier(int index) {
    final x = buttons[index];
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return ButtonTier.highlighted;
    } else {
      return ButtonTier.regular;
    }
  }

  void calcEqual() {
    final prevAnswer = answer;
    try {
      Expression exp = Parser().parse(userInput.replaceAll('x', '*'));
      answer = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
    } catch (e) {
      answer = prevAnswer;
      return;
    }
  }
}
