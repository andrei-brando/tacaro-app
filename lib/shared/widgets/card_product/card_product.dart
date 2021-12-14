import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
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
                child: Icon(Icons.ac_unit),
              ),
              title: Text('Produto'),
              subtitle: Text('Preço'),
            ),
            Text.rich(
              TextSpan(
                text: 'Agora\n',
                children: [
                  TextSpan(text: 'R\$ 67,50'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
