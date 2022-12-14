import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.inputType,
    this.inputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.controller,
    this.readyOnly,
  }) : super(key: key);

  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final Function? onChanged;
  final Function? validator;
  final String hintText;
  final TextEditingController? controller;
  final bool? readyOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readyOnly ?? false,
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: inputAction,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      onChanged: onChanged != null ? (value) => onChanged!(value) : null,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixIconOnPressed,
                icon: Icon(suffixIcon),
              )
            : null,
      ),
      validator: validator != null ? (value) => validator!() : null,
    );
  }
}
