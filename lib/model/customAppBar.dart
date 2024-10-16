// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showCart;
  final bool showLogout;

  CustomAppBar({
    required this.title,
    this.showCart = true, // Por padrão mostra o carrinho
    this.showLogout = true, // Por padrão mostra o botão de logout
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.orange,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      centerTitle: true,
      actions: <Widget>[
        if (showCart) // Mostra o carrinho somente se showCart for true
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.orange,
              tooltip: 'Ver seu pedido',
              onPressed: () {
                Navigator.pushNamed(context, 'carrinho');
              },
            ),
          ),
        if (showLogout) // Mostra o botão de logout se showLogout for true
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.orange,
              tooltip: 'Sair',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (Route<dynamic> route) => false);
              },
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
