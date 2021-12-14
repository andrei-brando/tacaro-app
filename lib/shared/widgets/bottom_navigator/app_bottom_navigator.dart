import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: AppTheme.colors.textEnabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavigatorItem(
            onTap: () => onChanged(0),
            enabled: currentIndex == 0,
            icon: Icons.home,
          ),
          BottomNavigatorItem(
            onTap: () => onChanged(1),
            enabled: currentIndex == 1,
            icon: Icons.add,
          ),
          BottomNavigatorItem(
            onTap: () => onChanged(2),
            enabled: currentIndex == 2,
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

class BottomNavigatorItem extends StatelessWidget {
  final Function() onTap;
  final bool enabled;
  final IconData icon;

  const BottomNavigatorItem({
    Key? key,
    required this.onTap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: enabled ? AppTheme.colors.primary : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: enabled
              ? AppTheme.colors.textEnabled
              : AppTheme.colors.iconInactive,
        ),
      ),
    );
  }
}
