import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme/theme.model.dart';
import '../ui/button/button.dart';
import '../services/math.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).dialogBackgroundColor,
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
                      child: Text(userInput,
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 30, right: 20, left: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: Theme.of(context).textTheme.headline6,
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
    });
  }
}
