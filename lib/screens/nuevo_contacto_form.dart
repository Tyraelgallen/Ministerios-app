// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ministerios/widgets_form/name_field_contacto.dart';

pcfirebase.CollectionReference contactoCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_contacto');

class NuevoContacto extends StatelessWidget {
  const NuevoContacto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Nuevo Contacto    ")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "registro_contacto");
              },
              icon: const Icon(Icons.person)),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Crear Nuevo Contacto",
              style: TextStyle(fontSize: 30),
            )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                "Formulario hecho para anotar los datos de las nuevas personas recién llegadas a la iglesia",
                style: TextStyle(
                  fontSize: 19,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const NameContacto(),
            const NumeroContacto(),
            const InfoContacto(),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 350,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                      onPressed: () {
                        if (PreferencesApp.firstLaunch == 1 ||
                            PreferencesApp.firstLaunch == 2) {
                          PreferencesApp.isPcApp == true
                              ? _addContactoPc()
                              : _crearRegistroContacto();
                        }
                        PreferencesContacto.nombre = "";
                        PreferencesContacto.numero = "";
                        PreferencesContacto.info = "";
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      child: const Text("Crear Contacto")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _crearRegistroContacto() async {
  final docRegistroproyeccion = androidfirebase.FirebaseFirestore.instance
      .collection('registro_contacto')
      .doc();

  final json = {
    'nombre': PreferencesContacto.nombre.toString() + " ".toString(),
    'numero': "${PreferencesContacto.numero} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesContacto.info} ",
  };

  //create document and write data to Firebase
  await docRegistroproyeccion.set(json);
}

_addContactoPc() async {
  final json = {
    'nombre': PreferencesContacto.nombre.toString() + " ".toString(),
    'numero': "${PreferencesContacto.numero} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesContacto.info} ",
  };
  await contactoCollectionPC.add(json);
}
