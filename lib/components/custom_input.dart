import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String textHint;
  final bool isPassword;
  final TextInputType keyboardInputType;

  const CustomInput({
    super.key,
    this.textHint = '',
    this.isPassword = false,
    this.keyboardInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardInputType,
      decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2.0,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
      ),
    );
  }
}
