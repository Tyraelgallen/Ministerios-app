// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ministerios/widgets_form/Tutorial_audiovisual.dart';

pcfirebase.CollectionReference tutorialCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_tutorial');

class CrearTutorial extends StatelessWidget {
  const CrearTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Nuevo Tutorial         ")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Crear Nuevo Tutorial",
              style: TextStyle(fontSize: 30),
            )),
            const SizedBox(height: 10),
            const NameTutorial(),
            const SizedBox(height: 10),
            const InfoTutorial(),
            const SizedBox(height: 10),
            const LinkTutorial(),
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
                              ? _addTutorialPc()
                              : _crearRegistroTutorial();
                        }
                        PreferencesTutorialAudiovisual.nombre = "";
                        PreferencesTutorialAudiovisual.info = "";
                        PreferencesTutorialAudiovisual.link = "";
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      child: const Text("Crear Enlace")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future _crearRegistroTutorial() async {
  final docRegistroproyeccion = androidfirebase.FirebaseFirestore.instance
      .collection('registro_tutorial')
      .doc();

  final json = {
    'nombre': PreferencesTutorialAudiovisual.nombre.toString() + " ".toString(),
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesTutorialAudiovisual.info} ",
    'link': "${PreferencesTutorialAudiovisual.link} ",
  };

  //create document and write data to Firebase
  await docRegistroproyeccion.set(json);
}

_addTutorialPc() async {
  final json = {
    'nombre': PreferencesTutorialAudiovisual.nombre.toString() + " ".toString(),
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesTutorialAudiovisual.info} ",
    'link': "${PreferencesTutorialAudiovisual.link} ",
  };
  await tutorialCollectionPC.add(json);
}
