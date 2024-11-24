import 'package:flutter/material.dart';

Widget campoTexto(label, controller, icone, {senha}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      controller: controller,
      obscureText: (senha!=null) ? senha : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icone),
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
