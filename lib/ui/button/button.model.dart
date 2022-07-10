enum ButtonTier { equal, regular, highlighted, operator }

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
  if (x == '/' || x == 'x' || x == '-' || x == '+') {
    return ButtonTier.operator;
  } else if (x == 'C' || x == 'DEL') {
    return ButtonTier.highlighted;
  } else if (x == "=") {
    return ButtonTier.equal;
  } else {
    return ButtonTier.regular;
  }
}
