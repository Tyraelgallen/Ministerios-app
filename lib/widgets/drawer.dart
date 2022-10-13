// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:ministerios/shared_pref/preferencesapp.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Configuración de Usuario"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "settings");
            },
          ),
          (PreferencesApp.firstLaunch != 3) & (PreferencesApp.contactos == true)
              ? ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text("Nuevo Contacto +"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "nuevo_contacto");
                  },
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          PreferencesApp.firstLaunch == 2
              ? ListTile(
                  leading: const Icon(Icons.view_list_outlined),
                  title: const Text("Registros"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "registros_screen");
                  },
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          const InfoApp(),
          const PrivacyPolicy(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Cerrar Sesión"),
            onTap: () {
              PreferencesApp.firstLaunch = 0;
              PreferencesApp.contactos = false;
              Navigator.pushReplacementNamed(context, "login_screen");
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/menu-img.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class InfoApp extends StatelessWidget {
  const InfoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PreferencesApp.firstLaunch == 2 || PreferencesApp.firstLaunch == 1) {
      return ListTile(
        leading: const Icon(Icons.menu_book),
        title: const Text("Info de la App"),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, "tutorial_app");
        },
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }
}

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.policy),
      title: const Text("Politica de Privacidad"),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, "privacypolicy");
      },
    );
  }
}
