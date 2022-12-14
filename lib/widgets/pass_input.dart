import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PassInput extends StatefulWidget {
  const PassInput({
    Key? key,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.inputAction,
    this.controller,
  }) : super(key: key);

  final Function? onChanged;
  final Function? validator;
  final String hintText;
  final TextInputAction? inputAction;
  final TextEditingController? controller;

  @override
  State<PassInput> createState() => _PassInputState();
}

class _PassInputState extends State<PassInput> {
  bool isObscure = true;

  void changeObscure() {
    setState(() => isObscure = !isObscure);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
      obscureText: isObscure,
      onChanged:
          widget.onChanged != null ? (value) => widget.onChanged!(value) : null,
      textInputAction: widget.inputAction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(FeatherIcons.lock),
        suffixIcon: IconButton(
          onPressed: () => changeObscure(),
          icon: isObscure
              ? const Icon(FeatherIcons.eye)
              : const Icon(FeatherIcons.eyeOff),
        ),
      ),
      validator:
          widget.validator != null ? (value) => widget.validator!() : null,
    );
  }
}
