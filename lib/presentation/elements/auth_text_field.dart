import 'package:flutter/material.dart';
import 'package:habit_builder_app/configurations/front_end.dart';

class AuthTextField extends StatefulWidget {
  AuthTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.isPasswordField,
    required this.controller,
    this.obscureText = false,
    this.validator,
    required this.fillColor,
    this.isPrefix = true,
    this.height = 56,
  }) : super(key: key);
  final String hintText;
  final IconData? prefixIcon;
  final bool isPasswordField;
  final bool isPrefix;
  final double height;
  final TextEditingController controller;
  final Function(String)? validator;
  final Color fillColor;
  bool obscureText;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => widget.validator!(val!),
      obscureText: widget.obscureText,
      controller: widget.controller,
      style: const TextStyle(
          color: FrontEndConfigs.kPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          fontFamily: 'Manrope'),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        border: InputBorder.none,
        errorStyle: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: 'Manrope'),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: FrontEndConfigs.kSecondaryColor.withOpacity(0.5),
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: 'Manrope'),
        prefixIcon: widget.isPrefix
            ? Icon(
                widget.prefixIcon,
                size: 20,
              )
            : null,
        suffix: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: widget.obscureText
                    ? const Text(
                        'Show',
                        style: TextStyle(
                            color: FrontEndConfigs.kSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Manrope'),
                      )
                    : const Text(
                        'Hide',
                        style: TextStyle(
                            color: FrontEndConfigs.kSecondaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Manrope'),
                      ),
              )
            : null,
      ),
    );
  }
}
