import 'package:flutter/material.dart';

import '../extensions/theme_extension.dart';

class InputText extends StatelessWidget {
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  InputText({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _obscureTextVN,
        builder: (_, obscureTextVNValue, __) => TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        color: context.primaryColor,
                      ),
                    )
                  : null),
        ),
      );
}
