import 'package:flutter/material.dart';
import 'package:ministerios/screens/home_screen.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:ministerios/theme/theme_manager.dart';
import 'package:ministerios/shared_pref/reset_prefs.dart';
import 'package:ministerios/widgets/custom_snackbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

ThemeManager themeManager = ThemeManager();

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        actualizar = true;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("           Configuracion"),
          leading: IconButton(
              onPressed: () {
                actualizar = true;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  _dialog(context);
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  thickness: 2.0,
                ),
                const Text("Ajustes de Usuario",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
                const Divider(
                  thickness: 2.0,
                ),
                SwitchListTile(
                    title: const Text("Modo Oscuro"),
                    value: themeManager.themeMode == ThemeMode.dark,
                    onChanged: (valor) {
                      themeManager.toggleTheme(valor);
                      PreferencesApp.isDarkMode = valor;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: PreferencesApp.name,
                    maxLength: 20,
                    onChanged: ((value) {
                      PreferencesApp.name = value;
                      setState(() {});
                    }),
                    decoration: const InputDecoration(
                      labelText: "Nombre",
                      counterText: "",
                      //helperText: "Nombre de Usuario",
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 17, top: 20, right: 17, bottom: 10),
                  child: Text(
                    "Indica tu nombre para que al momento de hacer los formularios, no lo tengas que reescribir.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const Divider(
                  thickness: 2.0,
                ),
                const Text("Ministerios Visibles",
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
                const Divider(
                  thickness: 2.0,
                ),
                SwitchListTile(
                    title: const Text("Audiovisual"),
                    value: PreferencesApp.visibleaudiovisual == true,
                    onChanged: (valor) {
                      PreferencesApp.visibleaudiovisual = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Sonido"),
                    value: PreferencesApp.visiblesonido == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblesonido = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Voces Adoración"),
                    value: PreferencesApp.visiblevoces == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblevoces = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Musicos Adoración"),
                    value: PreferencesApp.visiblemusicos == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblemusicos = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Organización"),
                    value: PreferencesApp.visibleorg == true,
                    onChanged: (valor) {
                      PreferencesApp.visibleorg = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Encargados de Calle"),
                    value: PreferencesApp.visiblecalle == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblecalle = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Fotografía y Plataformas"),
                    value: PreferencesApp.visiblefotografia == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblefotografia = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Cena del señor"),
                    value: PreferencesApp.visiblecena == true,
                    onChanged: (valor) {
                      PreferencesApp.visiblecena = valor;
                      setState(() {});
                    }),
                SwitchListTile(
                    title: const Text("Estética"),
                    value: PreferencesApp.visibleestetica == true,
                    onChanged: (valor) {
                      PreferencesApp.visibleestetica = valor;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future _dialog(context) async {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
            elevation: 20,
            title: const Center(child: Text("Limpiar Datos")),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Desea Limpiar los datos guardados de la App.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("NO")),
                  TextButton(
                      onPressed: () {
                        ResetPrefsAll();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(customSnackDeleteTotal());
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text("SI")),
                ],
              )
            ],
          ));
}
