import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.textStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.border),
            ),
          ),
          style: AppTheme.textStyles.input,
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value) {
            if (validator != null) {
              return validator!(value);
            }
          },
        ),
      ],
    );
  }
}
