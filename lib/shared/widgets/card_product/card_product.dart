import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  final bool like;
  const CardProduct({
    Key? key,
    this.like = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: AppTheme.colors.background,
                child: like
                    ? Icon(Icons.thumb_up_alt)
                    : Icon(Icons.thumb_down, color: AppTheme.colors.badColor),
              ),
              title: Text(
                'Produto',
                style: AppTheme.textStyles.titleListTile,
              ),
              subtitle: Text(
                'Preço',
                style: AppTheme.textStyles.subtitleListTile,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text.rich(
                TextSpan(
                  text: "Agora\n",
                  style: AppTheme.textStyles.subtitleListTile,
                  children: [
                    TextSpan(
                        text: "R\$ 67,50", style: AppTheme.textStyles.title),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
