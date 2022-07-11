import 'package:flutter/material.dart';
import 'button.model.dart';
export 'button.model.dart';

class TileButton extends StatelessWidget {
  final String buttonText;
  final Function() onClick;
  final ButtonTier tier;

  const TileButton(
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
        ButtonTier.operator: Theme.of(context).colorScheme.surface,
        ButtonTier.equal: Theme.of(context).primaryColor
      }[tier],
      highlightColor: {
        ButtonTier.regular: Theme.of(context).colorScheme.surface,
        ButtonTier.highlighted: Theme.of(context).colorScheme.surface,
        ButtonTier.operator: Theme.of(context).colorScheme.primary,
        ButtonTier.equal: Theme.of(context).primaryColorLight,
      }[tier],
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99999), side: BorderSide.none),
      child: ClipRRect(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: {
                ButtonTier.highlighted: Theme.of(context).primaryColor,
                ButtonTier.regular:
                    Theme.of(context).textTheme.bodyLarge!.color,
                ButtonTier.operator:
                    Theme.of(context).textTheme.bodyLarge!.color,
                ButtonTier.equal: Theme.of(context).scaffoldBackgroundColor,
              }[tier],
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
