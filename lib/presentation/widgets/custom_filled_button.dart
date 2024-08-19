import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Radius? radius;
  final Icon? icon;
  final void Function()? onPressed;

  const CustomFilledButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.radius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: radius ?? Radius.zero,
            bottomRight: radius ?? Radius.zero,
            topLeft: radius ?? Radius.zero,
            topRight: radius ?? Radius.zero,
          ))),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(width: 8), // Espacio entre el ícono y el texto
                Text(text),
              ],
            )
          : Text(text),
    );
  }
}
