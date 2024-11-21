// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecuperaSenhaView extends StatefulWidget {
  const RecuperaSenhaView({super.key});

  @override
  State<RecuperaSenhaView> createState() => _RecuperaSenhaViewState();
}

class _RecuperaSenhaViewState extends State<RecuperaSenhaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtEmail = TextEditingController();
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
                  'Redefinir Senha',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 200),
                
                // email
                TextFormField(
                  controller: txtEmail,
                  validator: (value) {
                    String valor = value.toString();
                    if (valor == null ||
                        !valor.contains('.') ||
                        !valor.contains('@')) {
                      return 'Insira um email válido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 70),

                // btn redefinir
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      // Recuperar os dados digitados
                      setState(() {
                        String vemail = txtEmail.text;
                        FirebaseAuth.instance.sendPasswordResetEmail(email: vemail);
                        //Exebir o resultado

                        msgKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text('Email enviado para $vemail'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 60.0),
                    child: Text(
                      'Redefinir',
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
