import 'package:flutter/material.dart';
import 'package:learn/widgets/loginWidgets/loginEnterButton.dart';
import 'package:learn/widgets/loginWidgets/loginAppBar.dart';
import 'package:learn/widgets/loginWidgets/loginInfoContainter.dart';

class LoginInputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginInputFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
      ],
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const LoginAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const LoginInfoContainer(
                      title: "Bem-vindo à Coinny",
                      description:
                          "Para iniciar sua sessão, insira suas credenciais de login."),
                  const SizedBox(height: 32),
                  LoginInputFields(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 32),
                  LoginEnterButton(
                      onPressed: () {
                        // Aqui você implementará a lógica de login.
                      },
                      title: "Entrar",
                      colors: const [Color(0xFF646AE3), Color(0xFF262B91)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}