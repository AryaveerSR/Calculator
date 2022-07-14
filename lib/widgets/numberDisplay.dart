import 'package:flutter/material.dart';
import '../widgets/numberPad/CircleButton/button.model.dart';

class NumberDisplay extends StatelessWidget {
  final String userInput;
  final String answer;
  const NumberDisplay({Key? key, required this.userInput, required this.answer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              answer.isEmpty ? '0' : answer,
              style: Theme.of(context).textTheme.headline6,
            ),
          )),
      Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: userInput.isEmpty
                    ? ([
                        Text('0',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 42,
                                fontWeight: FontWeight.w600))
                      ])
                    : (userInput
                        .split('')
                        .map((e) => "+-%x".contains(e)
                            ? Icon(
                                getIconFromOperator(e),
                                color: Theme.of(context).colorScheme.onSurface,
                                shadows: [
                                  Shadow(
                                    blurRadius: 0,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    offset: const Offset(1, -1),
                                  ),
                                  Shadow(
                                    blurRadius: 0,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    offset: const Offset(-1, -1),
                                  ),
                                ],
                                size: 42,
                              )
                            : Text(e,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 42,
                                    fontWeight: FontWeight.w600)))
                        .toList())),
          )),
    ]));
  }
}
