import 'package:flutter/material.dart';

import '../ui/button/button.dart';
import '../service/math.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userInput = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 4),
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return TileButton(
                    onClick: () {
                      final btn = buttons[index];
                      if (btn == "C") {
                        setState(() {
                          userInput = '';
                          answer = '';
                          answer = calcEqual(
                              userInput: userInput, prevAnswer: answer);
                        });
                      } else if (btn == "DEL") {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          answer = calcEqual(
                              userInput: userInput, prevAnswer: answer);
                        });
                      } else if (btn == "=") {
                        setState(() {
                          userInput = answer.isEmpty ? userInput : answer;
                          answer = '';
                        });
                      } else if (btn == "+/-") {
                        setState(() {
                          userInput = toggleNegative(userInput);
                          answer = calcEqual(
                              userInput: userInput, prevAnswer: answer);
                        });
                      } else {
                        setState(() {
                          userInput += btn;
                          answer = calcEqual(
                              userInput: userInput, prevAnswer: answer);
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
}
