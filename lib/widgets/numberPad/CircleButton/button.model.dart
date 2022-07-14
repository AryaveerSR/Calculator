import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

enum ButtonTier { equal, regular, highlighted, operator, danger }

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

ButtonTier getTier(int index) {
  final x = buttons[index];
  if ('/x+-'.contains(x)) {
    return ButtonTier.operator;
  } else if ('DELC'.contains(x)) {
    return ButtonTier.danger;
  } else if ("%.+/-".contains(x)) {
    return ButtonTier.highlighted;
  } else if (x == "=") {
    return ButtonTier.equal;
  } else {
    return ButtonTier.regular;
  }
}

Color getColorFromTier(ButtonTier tier, BuildContext context) {
  return {
    ButtonTier.highlighted: Theme.of(context).primaryColor,
    ButtonTier.regular: Theme.of(context).textTheme.bodyLarge!.color,
    ButtonTier.operator: Theme.of(context).textTheme.bodyLarge!.color,
    ButtonTier.danger: Theme.of(context).errorColor,
    ButtonTier.equal: Theme.of(context).scaffoldBackgroundColor,
  }[tier]!;
}

IconData getIconFromOperator(String op) {
  return {
    "+": FeatherIcons.plus,
    "-": FeatherIcons.minus,
    "x": FeatherIcons.x,
    "%": FeatherIcons.percent,
    "DEL": FeatherIcons.rotateCcw,
    "=": FeatherIcons.check,
  }[op]!;
}
