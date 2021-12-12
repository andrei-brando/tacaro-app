import 'package:tacaro/shared/theme/app_colors.dart';
import 'package:tacaro/shared/theme/text_styles.dart';

export 'app_text.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColorsImp();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStylesImp();
  static AppTextStyles get textStyles => instance._textStyles;
}
