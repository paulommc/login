// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
import 'package:login/view/components/text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
   /*  txtEmail.text = 'flutter@gmail.com';
    txtSenha.text = '12345678'; */
    super.initState();
  }

  void limparcampos() {
    txtEmail.clear();
    txtSenha.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagem
                Image.asset('../lib/images/login_remove.png'),
                

                // Campo de email
                campoTexto('Email', txtEmail, Icons.email),
                SizedBox(height: 20),

                // Campo de senha
                campoTexto('Senha', txtSenha, Icons.password, senha: true),
                SizedBox(height: 10),

                // Esqueceu a senha
                Align(
                  alignment: Alignment.bottomRight,
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
                    //Login
                    LoginController().login(
                      context,
                      txtEmail.text,
                      txtSenha.text,
                    );
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
