import 'package:flutter/material.dart';

enum ButtonTier { regular, highlighted }

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function() onClick;
  final ButtonTier tier;

  const MyButton(
      {Key? key,
      required this.buttonText,
      required this.onClick,
      required this.tier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ClipRRect(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: {
                  ButtonTier.highlighted: Colors.blue.shade600,
                  ButtonTier.regular: Colors.black,
                }[tier],
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
