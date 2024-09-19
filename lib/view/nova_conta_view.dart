// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class NovaContaView extends StatefulWidget {
  const NovaContaView({super.key});

  @override
  State<NovaContaView> createState() => _NovaContaViewState();
}

class _NovaContaViewState extends State<NovaContaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var senha2 = TextEditingController();
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NOVA CONTA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 150),
                // nome
                TextFormField(
                  controller: nome,
                  validator: (value) {
                    //String valor = value.toString();
                    if (value == null) {
                      return 'Insira um nome válido';
                    }
                    if (value.length < 3) {
                      return 'Insira um nome válido com ao menos 3 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // email
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

                //senha
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

                SizedBox(height: 20),
                // confirme a senha
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Sua senha deve conter ao menos 8 caractéres';
                    } else if (value.length < 8) {
                      return 'Sua senha deve conter ao menos 8 caractéres';
                    }
                    return null;
                  },
                  controller: senha2,
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
                    if (formkey.currentState!.validate()) {
                      // Recuperar os dados digitados
                      setState(() {
                        String vemail = email.text;
                        String s1 = senha.text;
                        String s2 = senha2.text;
                        //Exebir o resultado
                        if (s1 == s2) {
                          msgKey.currentState!.showSnackBar(
                            SnackBar(
                              content:
                                  Text('Conta $vemail criada com sucesso!'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          Timer(Duration(seconds: 4), () {
                            //Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(context, 'login',
                                (Route<dynamic> route) => false);
                          });
                        } else {
                          msgKey.currentState!.showSnackBar(
                            SnackBar(
                              content: Text('As senhas dever ser iguais.'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      });
                    }
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
