import 'package:flutter/material.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_text_styles.dart';

/// {@template custom_text_field}
/// CustomTextField widget.
/// {@endtemplate}
class CustomTextField extends StatefulWidget {
  /// {@macro custom_text_field}
  const CustomTextField({
    super.key,
    this.controller,
    this.decoration,
    this.validator,
    this.hintText,
    this.onChanged,
    this.hasError = false,
  });

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool hasError;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() => _hasFocus = _focusNode.hasFocus);
      });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Color get _fillColor {
    if (_hasError || _hasFocus || widget.hasError) return appScheme.white;
    return appScheme.gray25;
  }

  @override
  Widget build(BuildContext context) => FormField<String>(
    validator: widget.validator,
    builder: (fieldState) {
      _hasError = fieldState.hasError;
      return TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        onChanged: (value) {
          widget.onChanged?.call(value);
          fieldState.didChange(value);
        },
        validator: widget.validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: _fillColor,
          hintText: widget.hintText,
          hintStyle: appFont.useFont(
            fontWeight: FontWeight.w400,
            color: appScheme.gray400,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appScheme.blue500,
              width: 0.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: appScheme.red300,
              width: 0.5,
            ),
          ),
        ),
      );
    },
  );
}
