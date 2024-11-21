// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

  Widget campoTexto(String label, TextEditingController controller, IconData icone, {bool senha = false}) {
    return TextFormField(
      controller: controller,
      obscureText: senha,
      validator: (value) {
        if (label == 'Email' && (value == null || !value.contains('@') || !value.contains('.'))) {
          return 'Insira um email válido';
        }
        if (label == 'Senha' && (value == null || value.length < 8)) {
          return 'Sua senha deve conter ao menos 8 caracteres';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icone),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget botaoCancelar(BuildContext context, String texto) {
    return OutlinedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: OutlinedButton.styleFrom(minimumSize: const Size(140, 40)),
      child: Text(texto),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: msgKey,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(height: 60),
                campoTexto('Email', txtEmail, Icons.email),
                SizedBox(height: 20),
                campoTexto('Senha', txtSenha, Icons.lock, senha: true),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Esqueceu a senha?"),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Text(
                                    "Identifique-se para receber um email com as instruções e o link para criar uma nova senha.",
                                  ),
                                  SizedBox(height: 25),
                                  campoTexto('Email', txtEmailEsqueceuSenha, Icons.email),
                                ],
                              ),
                            ),
                            actionsPadding: EdgeInsets.all(20),
                            actions: [
                              botaoCancelar(context, 'Cancelar'),
                              ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(140, 40),
                                ),
                                onPressed: () {
                                  esqueceuSenha(context, txtEmailEsqueceuSenha.text);
                                },
                                child: Text('Enviar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Esqueceu a senha?'),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(140, 40),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginUsuario();
                    }
                  },
                  child: Text('Entrar'),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ainda não tem conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastrar');
                      },
                      child: Text('Cadastre-se'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  } */



class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  /* final FirebaseAuth auth = FirebaseAuth.instance; */
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  /*  @override
  void initState() {
    txtEmail.text = 'flutter@gmail.com';
    senha.text = '12345678';
    super.initState();
  } */

  void limparcampos() {
    txtEmail.clear();
    txtSenha.clear();
  }

 Future<void> loginUsuario(context, email, senha) async {
    // Autenticação com Firebase
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: senha,
    ).then((resultado) {
      // Redirecionar ao login bem-sucedido
      //limparcampos();
      Navigator.pushNamed(context, 'categorias');
    }).catchError((e){
      String errorMessage;

      // Tratamento de erros do Firebase
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Usuário não encontrado.';
          break;
        case 'wrong-password' || 'invalid-email':
          errorMessage = 'Email ou senha inválida.';
          break;
        case 'invalid-credential':
          errorMessage = 'Credencial inválida';
        default:
          errorMessage = 'Erro desconhecido: ${e.code.toString()}';
      }

      // Exibir mensagem de erro
      msgKey.currentState!.showSnackBar(
        SnackBar(content: Text(errorMessage), duration: Duration(seconds: 3)),
      );

    });
  }

    Future<void> esqueceuSenha(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.of(context).pop(); // Fechar o diálogo
      msgKey.currentState!.showSnackBar(
        SnackBar(
          content: Text('Email de redefinição de senha enviado!'),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      msgKey.currentState!.showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar email de redefinição: $e'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  controller: txtEmail,
                  validator: (value) {
                    if (value == null ||
                        !value.contains('.') ||
                        !value.contains('@')) {
                      return 'Insira um email válido';
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
                    if (value == null || value.length < 8) {
                      return 'Sua senha deve conter ao menos 8 caracteres';
                    }
                    return null;
                  },
                  controller: txtSenha,
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
                      loginUsuario(
                        context,
                        txtEmail.text,
                        txtSenha.text
                      );
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
