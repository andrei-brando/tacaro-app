import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

extension TextExt on Text {
  Text get label => Text(
        this.data!,
        style: AppTheme.textStyles.label,
      );
}
