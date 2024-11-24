// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login/controller/login_controller.dart';
import 'package:login/view/components/text_field.dart';

class RecuperaSenhaView extends StatefulWidget {
  const RecuperaSenhaView({super.key});

  @override
  State<RecuperaSenhaView> createState() => _RecuperaSenhaViewState();
}

class _RecuperaSenhaViewState extends State<RecuperaSenhaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtEmailEsqueceuSenha = TextEditingController();
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
                campoTexto('Email', txtEmailEsqueceuSenha, Icons.email),
                SizedBox(height: 70),

                // btn redefinir
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    LoginController().esqueceuSenha(
                      context, 
                      txtEmailEsqueceuSenha.text
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 60.0),
                    child: Text(
                      'Enviar código',
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
