import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final Widget? trailingIcon;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;

  const myTextField({
    super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.trailingIcon,
    this.isObscureText = false,
    this.validator,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onChanged: onchanged,
      validator: validator,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: trailingIcon,

        // focusedBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        // )
      ),
    );
  }
}
