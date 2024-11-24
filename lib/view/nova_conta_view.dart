// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
import 'package:login/view/components/mensagem.dart';
import 'package:login/view/components/text_field.dart';

class NovaContaView extends StatefulWidget {
  const NovaContaView({super.key});

  @override
  State<NovaContaView> createState() => _NovaContaViewState();
}

class _NovaContaViewState extends State<NovaContaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtConfirmarSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: msgKey,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text(
                  'NOVA CONTA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 150),
                // nome
                campoTexto('Nome', txtNome, Icons.person),
                SizedBox(height: 20),

                // email
                campoTexto('Email', txtEmail, Icons.email),
                SizedBox(height: 20),

                //senha
                campoTexto('Senha', txtSenha, Icons.password, senha: true),
                SizedBox(height: 20),
                // confirme a senha
                TextFormField(
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Sua senha deve conter ao menos 8 caractéres';
                    }
                    return null;
                  },
                  controller: txtConfirmarSenha,
                  decoration: InputDecoration(
                    labelText: 'Confirme a Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 50),

                // btn CRiar Conta
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    //if (formkey.currentState!.validate()) {
                      // Recuperar os dados digitados
                        String s1 = txtSenha.text;
                        String s2 = txtConfirmarSenha.text;
                        //Exebir o resultado
                        if (s1 == s2) {
                          LoginController().criarConta(context, txtNome.text,
                              txtEmail.text, txtSenha.text);
                              sucesso(context, 'Usuario criado com sucesso');
/*                           Timer(Duration(seconds: 4), () {
                            //Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(context, 'login',
                                (Route<dynamic> route) => false);
                          }); */
                        } else {
                          msgKey.currentState!.showSnackBar(
                            SnackBar(
                              content: Text('As senhas dever ser iguais.'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      
                    //}
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 60.0),
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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
