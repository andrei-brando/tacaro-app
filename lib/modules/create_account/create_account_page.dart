import 'package:flutter/material.dart';
import 'package:tacaro/modules/create_account/create_account_controller.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController controller = CreateAccountController();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
        success: (value) => Navigator.pushNamed(context, '/home'),
        // error: (message, _) => _scaffoldKey.currentState!.showBottomSheet(
        //   (context) => BottomSheet(
        //     onClosing: () {},
        //     builder: (context) => Container(
        //       child: Text(message),
        //     ),
        //   ),
        // ),
        error: (message, _) => print(message),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            child: Form(
              key: controller.formKey,
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
                    onChanged: (value) => controller.onChange(name: value),
                    validator: (value) {
                      if (value != null) {
                        return value.isNotEmpty
                            ? null
                            : 'Digite seu nome completo';
                      }
                      return 'Nome deve ser preenchido';
                    },
                  ),
                  SizedBox(height: 18),
                  InputText(
                    label: 'E-mail',
                    hint: 'Digite seu e-mail',
                    onChanged: (value) => controller.onChange(email: value),
                    validator: (value) =>
                        isEmail(value!) ? null : 'Digite um e-mail válido',
                  ),
                  SizedBox(height: 18),
                  InputText(
                    label: 'Senha',
                    hint: 'Digite sua senha',
                    obscure: true,
                    onChanged: (value) => controller.onChange(password: value),
                    validator: (value) {
                      if (value != null) {
                        return value.length >= 6
                            ? null
                            : 'Digite uma senha mais forte';
                      }
                      return 'Senha deve ser preenchida';
                    },
                  ),
                  SizedBox(height: 14),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) => controller.state.when(
                      loading: () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                      orElse: () => Button(
                        label: 'Criar Conta',
                        onTap: () => controller.create(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
