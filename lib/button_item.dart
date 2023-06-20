import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final String? buttonText;
  final Color? textColor;
  final Function? onTap;

  const ButtonItem({
    super.key,
    this.buttonText,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap!(),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        fixedSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width / 4,
            MediaQuery.of(context).size.height / 7,
          ),
        ),
      ),
      child: Text(
        buttonText!,
        style: TextStyle(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
