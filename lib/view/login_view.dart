// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  void initState() {
    email.text = 'flutter@gmail.com';
    senha.text = '12345678';
    super.initState();
  }

  void limparcampos() {
    email.clear();
    senha.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: msgKey,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagem
                Image.asset('../lib/images/login_remove.png'),
                // Campo de email
                TextFormField(
                  controller: email,
                  validator: (value) {
                    String valor = value.toString();
                    if (value == null) {
                      return 'Insira um Email Válido';
                    } else if (!valor.contains('@')) {
                      return 'Insira um Email Válido';
                    } else if (!valor.contains('.')) {
                      return 'Insira um Email Válido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Campo de senha
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Sua senha deve conter ao menos 8 caractéres';
                    } else if (value.length < 8) {
                      return 'Sua senha deve conter ao menos 8 caractéres';
                    }
                    return null;
                  },
                  controller: senha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),

                // Esqueceu a senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      limparcampos();
                      Navigator.pushNamed(context, 'recupera_senha');
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Botão "Entrar"
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (email.text == 'flutter@gmail.com' &&
                          senha.text == '12345678') {
                        limparcampos();
                        Navigator.pushNamed(context, 'main');
                      } else {
                        msgKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text('Email ou senha inválidos'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        limparcampos();
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 60.0),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Link "Nova conta"
                TextButton(
                  onPressed: () {
                    limparcampos();
                    Navigator.pushNamed(context, 'nova_conta');
                  },
                  child: Text(
                    'Nova conta',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
