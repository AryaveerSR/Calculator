import 'package:flutter/material.dart';
import 'button.model.dart';
export 'button.model.dart';

class CircleButton extends StatelessWidget {
  final String buttonText;
  final Function() onClick;
  final ButtonTier tier;

  const CircleButton(
      {Key? key,
      required this.buttonText,
      required this.onClick,
      required this.tier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      fillColor: {
        ButtonTier.regular: Colors.transparent,
        ButtonTier.highlighted: Colors.transparent,
        ButtonTier.danger: Colors.transparent,
        ButtonTier.operator: Theme.of(context).colorScheme.surface,
        ButtonTier.equal: Theme.of(context).primaryColor
      }[tier],
      highlightColor: {
        ButtonTier.regular: Theme.of(context).colorScheme.surface,
        ButtonTier.highlighted: Theme.of(context).colorScheme.surface,
        ButtonTier.danger: Theme.of(context).colorScheme.surface,
        ButtonTier.operator: Theme.of(context).colorScheme.primary,
        ButtonTier.equal: Theme.of(context).primaryColorLight,
      }[tier],
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999), side: BorderSide.none),
      child: ClipRRect(
        child: Center(
          child: "+-x%DEL=".contains(buttonText)
              ? Icon(
                  getIconFromOperator(buttonText),
                  size: 20,
                  color: getColorFromTier(tier, context),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    color: getColorFromTier(tier, context),
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
