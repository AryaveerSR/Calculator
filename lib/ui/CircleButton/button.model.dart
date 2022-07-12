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
