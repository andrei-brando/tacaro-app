import 'package:flutter/material.dart';
import 'package:tacaro/modules/login/login_controller.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/button/button.dart';
import 'package:tacaro/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        loading: () => print('loading'),
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
      key: _scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tacaro-logo.png',
                    width: size.height * .3,
                    height: size.height * .3,
                  ),
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
                      loading: () => CircularProgressIndicator(),
                      orElse: () => Column(
                        children: [
                          Button(
                            label: 'Entrar',
                            onTap: () => controller.login(),
                          ),
                          SizedBox(height: 48),
                          Button(
                            label: 'Criar Conta',
                            type: ButtonType.outline,
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/create-account',
                            ),
                          ),
                        ],
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
