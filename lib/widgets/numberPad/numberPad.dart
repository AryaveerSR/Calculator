import 'package:flutter/material.dart';

import './CircleButton/button.dart';
import '../../services/math.dart';
import '../../services/calc.model.dart';

class NumberPad extends StatelessWidget {
  CalcProvider val;
  NumberPad({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 4),
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return CircleButton(
              onClick: () {
                final btn = buttons[index];
                if (btn == "C") {
                  if (val.userInput.isNotEmpty) {
                    val.userInput = '';
                    val.answer = '';
                  }
                } else if (btn == "DEL") {
                  if (val.userInput.isNotEmpty) {
                    val.userInput =
                        val.userInput.substring(0, val.userInput.length - 1);
                    calcEqual(val);
                  }
                } else if (btn == "=") {
                  final userI = val.userInput;
                  val.userInput =
                      val.answer.isEmpty ? val.userInput : val.answer;
                  val.answer = userI;
                } else if (btn == "+/-") {
                  if (val.userInput.isNotEmpty) {
                    toggleNegative(val);
                    calcEqual(val);
                  }
                } else {
                  if ("/x+%.".contains(btn) &&
                      "/x+-%.".contains(
                          val.userInput.substring(val.userInput.length - 1))) {
                    return;
                  }
                  val.userInput += btn;
                  calcEqual(val);
                }
              },
              tier: getTier(index),
              buttonText: buttons[index],
            );
          }),
    );
  }
}
