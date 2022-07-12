import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class NumberDisplay extends StatelessWidget {
  final String userInput;
  final String answer;
  const NumberDisplay({Key? key, required this.userInput, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        child: Text(userInput.isEmpty ? '0' : userInput,
            style: Theme.of(context).textTheme.headline3),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
        alignment: Alignment.centerRight,
        child: Text(
          answer.isEmpty ? '0' : answer,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    ]));
  }
}
