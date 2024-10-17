// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';

class RecuperaSenhaView extends StatefulWidget {
  const RecuperaSenhaView({super.key});

  @override
  State<RecuperaSenhaView> createState() => _RecuperaSenhaViewState();
}

class _RecuperaSenhaViewState extends State<RecuperaSenhaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var email = TextEditingController();
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
                        String vemail = email.text;

                        //Exebir o resultado

                        msgKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text('Email enviado para $vemail'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                      Timer(Duration(seconds: 4), () {
                        Navigator.pop(context);
                      });
                    }
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
