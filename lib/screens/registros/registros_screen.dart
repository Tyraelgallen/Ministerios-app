// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class RegistrosScreen extends StatelessWidget {
  const RegistrosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Registros"),
      ),
      body: Container(
        //color: Colors.amber,
        width: double.infinity,
        height: 1500,
        child: const PreferPC(),
      ),
    );
  }
}

class PreferPC extends StatelessWidget {
  const PreferPC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Audiovisual"),
          onTap: () {
            PreferencesApp.isPcApp == true
                ? Navigator.pushNamed(context, "registros_audiovisual_pc")
                : Navigator.pushNamed(context, "registros_audiovisual");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Sonido"),
          onTap: () {
            Navigator.pushNamed(context, "registros_sonido");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Voces Adoración"),
          onTap: () {
            Navigator.pushNamed(context, "registros_voces");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Músicos Adoración"),
          onTap: () {
            Navigator.pushNamed(context, "registros_musicos");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Organización"),
          onTap: () {
            Navigator.pushNamed(context, "registros_organizacion");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Encargado de Calle"),
          onTap: () {
            Navigator.pushNamed(context, "registros_calle");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Fotografía y Plataformas"),
          onTap: () {
            Navigator.pushNamed(context, "registros_fotografia");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Santa Cena"),
          onTap: () {
            Navigator.pushNamed(context, "registros_cena");
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers_outlined),
          title: const Text("Estética"),
          onTap: () {
            Navigator.pushNamed(context, "registros_estetica");
          },
        ),
      ],
    );
  }
}
