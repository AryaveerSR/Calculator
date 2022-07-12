import 'package:calculator/services/calc.model.dart';
import 'package:math_expressions/math_expressions.dart';

void calcEqual(CalcProvider val) {
  String input = val.userInput.replaceAll('x', '*');
  if ("/*+-%.".contains(input.substring(input.length - 1))) {
    input = input.substring(0, input.length - 1);
  }
  try {
    Expression exp = Parser().parse(input);
    final ans = exp.evaluate(EvaluationType.REAL, ContextModel());
    ans % 1 == 0
        ? val.answer = (ans as double).toInt().toString()
        : val.answer = ans.toString();
  } catch (e) {
    val.answer = 'Error';
  }
}

void toggleNegative(CalcProvider val) {
  final lastGroup = val.userInput.split(RegExp(r'[+,x,/,%]')).last;
  if (lastGroup.startsWith('-')) {
    val.userInput = val.userInput.replaceFirst(
        lastGroup,
        lastGroup.substring(1),
        val.userInput
            .substring(0, val.userInput.length - lastGroup.length)
            .length);
  } else {
    val.userInput = val.userInput.replaceFirst(
        lastGroup,
        '-$lastGroup',
        val.userInput
            .substring(0, val.userInput.length - lastGroup.length)
            .length);
  }
}
