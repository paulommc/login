import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/components/mensagem.dart';

class LoginController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //
  // Criação de um nova conta de usuário
  // no Firebase Authentication
  //
void criarConta(context, nome, email, senha) {

    auth.createUserWithEmailAndPassword(
      email: email, password: senha
    ).then((resultado){

      //
      //Armazenar o nome do usuario no firestore
      //
      FirebaseFirestore.instance.collection('usuarios')
        .add(
          {
            'uid': resultado.user!.uid,
            'nome': nome,
          },
        );

      sucesso(context,'Usuário criado com sucesso!');
      Navigator.pop(context);
    }).catchError((e){
      switch(e.code){
          case 'email-already-in-use':
          erro(context,'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context,'O formato do email é inválido.');
          break;
        default:
          erro(context,'ERRO: ${e.code.toString()}');
      }

    });
  }

  //
  // LOGIN
  // Efetuar o login de um usuário previamente cadastrado
  // no serviço Firebase Authentication
  //
  void login(context, email, senha) {

    auth.signInWithEmailAndPassword(
      email: email, password: senha
    ).then((resultado){
      sucesso(context, 'Usuário autenticado com sucesso!');
      Navigator.pushNamed(context, 'principal');
    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
          erro(context, 'O formato do email é inválido');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  //
  // ESQUECEU A SENHA
  // Envia uma mensagem de email para recuperação de senha para
  // um conta de email válida
  //
  void esqueceuSenha(context, String email) {
    if(email.isNotEmpty){
      auth.sendPasswordResetEmail(email: email);
      sucesso(context, 'Email enviado com sucesso');
    }
    else{
      erro(context, 'Informe o email para a recuperação.');
    }
    Navigator.pop(context);
  }

  //
  // LOGOUT
  //
  logout() {
    auth.signOut();
  }

  //
  // ID do Usuário Logado
  //
  idUsuario() {
    return auth.currentUser!.uid;
  }

  //
  // NOME do Usuário Logado
  //
  Future<String> usuarioLogado() async {
    var nome = '';
    await FirebaseFirestore.instance                                        //
      .collection('usuarios')                                               //
      .where('uid', isEqualTo: idUsuario())                                 //
      .get()                                                                //
      .then((resultado){nome = resultado.docs[0].data()['nome'] ?? '';      //
      });
    return nome;
  }
}
