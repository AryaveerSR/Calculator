// The thing i ingored in high school
import 'package:math_expressions/math_expressions.dart';

String calcEqual({required String userInput, required String prevAnswer}) {
  try {
    Expression exp = Parser().parse(userInput.replaceAll('x', '*'));
    return exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
  } catch (e) {
    return userInput.isEmpty ? '' : prevAnswer;
  }
}

String toggleNegative(String userInput) {
  final lastGroup = userInput.split(RegExp(r'[+,x,/,%]')).last;
  if (lastGroup.startsWith('-')) {
    return userInput.replaceFirst(lastGroup, lastGroup.substring(1),
        userInput.substring(0, userInput.length - lastGroup.length).length);
  } else {
    return userInput.replaceFirst(lastGroup, '-$lastGroup',
        userInput.substring(0, userInput.length - lastGroup.length).length);
  }
}
