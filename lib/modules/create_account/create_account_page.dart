import 'package:flutter/material.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
      ),
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        child: Container(
          height: size.height - size.height * 0.2,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Criando uma conta',
                  style: AppTheme.textStyles.title,
                ),
                SizedBox(height: 10),
                Text(
                  'Mantenha seus gastos em dia',
                  style: AppTheme.textStyles.subtitle,
                ),
                SizedBox(height: 38),
                InputText(
                  label: 'Nome',
                  hint: 'Digite seu nome completo',
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'E-mail',
                  hint: 'Digite seu e-mail',
                ),
                SizedBox(height: 18),
                InputText(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  obscure: true,
                ),
                SizedBox(height: 14),
                Button(
                  label: 'Criar Conta',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
