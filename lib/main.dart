// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:login/view/cardapio_view.dart';
import 'package:login/view/carrinho_view.dart';
import 'package:login/view/categorias_view.dart';
import 'package:login/view/detalhes_view.dart';
import 'package:login/view/login_view.dart';
import 'package:login/view/nova_conta_view.dart';
import 'package:login/view/recupera_senha_view.dart';

//stateless inerface
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'categorias': (context) => CategoriasView(),
        'nova_conta': (context) => NovaContaView(),
        'recupera_senha': (context) => RecuperaSenhaView(),
        'detalhes': (context) => DetalhesView(),
        'cardapio': (context) => CardapioView(),
        'carrinho': (context) => CarrinhoView(),
      },
    );
  }
}
