import 'package:flutter/material.dart' hide AppBar;
import 'package:provider/provider.dart';

import '../services/calc.model.dart';
import '../widgets/numberDisplay.dart';
import '../widgets/numberPad/numberPad.dart';
import '../ui/appBar/appBar.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalcProvider>(
        builder: (context, val, child) => Scaffold(
              appBar: const AppBar(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NumberDisplay(userInput: val.userInput, answer: val.answer),
                  NumberPad(val: val)
                ],
              ),
            ));
  }
}
