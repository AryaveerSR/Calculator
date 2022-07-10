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
        ButtonTier.regular: Colors.white,
        ButtonTier.highlighted: Colors.white,
        ButtonTier.operator: Colors.grey.shade100,
        ButtonTier.equal: Colors.blue,
      }[tier],
      highlightColor: {
        ButtonTier.regular: Colors.grey.shade100,
        ButtonTier.highlighted: Colors.grey.shade100,
        ButtonTier.operator: Colors.grey.shade200,
        ButtonTier.equal: Colors.blue.shade300,
      }[tier],
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99999),
          side: const BorderSide(color: Colors.white)),
      child: ClipRRect(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: {
                ButtonTier.highlighted: Colors.blue.shade600,
                ButtonTier.regular: Colors.black,
                ButtonTier.operator: Colors.black,
                ButtonTier.equal: Colors.white
              }[tier],
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
