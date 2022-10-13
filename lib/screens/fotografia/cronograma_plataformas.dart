// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ministerios/widgets_form/cronograma_plataformas.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

pcfirebase.CollectionReference cronogramaPlataformasCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_cronogramaplataformas');

class CrearCronogramaPlataformas extends StatefulWidget {
  const CrearCronogramaPlataformas({Key? key}) : super(key: key);

  @override
  State<CrearCronogramaPlataformas> createState() =>
      _CrearCronogramaPlataformasState();
}

class _CrearCronogramaPlataformasState
    extends State<CrearCronogramaPlataformas> {
  PlatformFile? pickedFile;
  File? file;
  UploadTask? uploadTask;
  bool uploaded = false;
  bool progress = false;

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result == null) {
      return;
    }

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'cronogramaplataformas/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    if (file == null) return;

    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);
    progress = true;
    setState(() {});
    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        uploaded = true;
        progress = false;
      });
    });
    final urlDownload = await snapshot.ref.getDownloadURL();
    // print("download link: $urlDownload");
    PreferencesCronogramaPlataformas.link = urlDownload;
    PreferencesCronogramaPlataformas.path = path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cronograma Plataformas         ")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Crear Nuevo Recordatorio",
              style: TextStyle(fontSize: 25),
            )),
            const SizedBox(height: 10),
            const NameCronogramaPlataformas(),
            const SizedBox(height: 10),
            const FechaIngresoPlataformas(),
            const SizedBox(height: 10),
            const FechaPublicacionPlataformas(),
            const SizedBox(height: 10),
            const InfoCronogramaPlataformas(),
            const SizedBox(height: 10),
            Column(
              children: [
                if (pickedFile != null)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue[100],
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        //fit: BoxFit.,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            if ((progress == false) & (uploaded == false))
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                        onPressed: () {
                          selectFile();
                        },
                        child: const Text("Seleccionar Imagen")),
                  ),
                ),
              )
            else
              const SizedBox(height: 0, width: 0),
            const SizedBox(height: 10),
            if ((progress == false) & (uploaded == false))
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                        onPressed: () {
                          if (pickedFile != null) {
                            uploadFile();
                          }
                        },
                        child: const Text("Subir Imagen")),
                  ),
                ),
              )
            else
              const SizedBox(height: 0, width: 0),
            progress == true
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox(height: 0, width: 0),
            const SizedBox(height: 10),
            uploaded == true
                ? Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (PreferencesApp.firstLaunch == 1 ||
                                    PreferencesApp.firstLaunch == 2) {
                                  PreferencesApp.isPcApp == true
                                      ? _addCronogramaPlataformasPc()
                                      : _crearRegistroCronogramaPlataformas();
                                }
                                PreferencesCronogramaPlataformas.nombre = "";
                                PreferencesCronogramaPlataformas.info = "";
                                PreferencesCronogramaPlataformas.link = "";
                                PreferencesCronogramaPlataformas.fecha = "";
                                PreferencesCronogramaPlataformas.publicacion =
                                    "";
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Crear Evento")),
                      ),
                    ),
                  )
                : const SizedBox(height: 0, width: 0),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Future _crearRegistroCronogramaPlataformas() async {
  final docRegistro = androidfirebase.FirebaseFirestore.instance
      .collection('registro_cronogramaplataformas')
      .doc();

  final json = {
    'nombre':
        PreferencesCronogramaPlataformas.nombre.toString() + " ".toString(),
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesCronogramaPlataformas.info} ",
    'link': PreferencesCronogramaPlataformas.link,
    'path': PreferencesCronogramaPlataformas.path,
    'fecha': "${PreferencesCronogramaPlataformas.fecha} ",
    'publicacion': "${PreferencesCronogramaPlataformas.publicacion} ",
  };

  //create document and write data to Firebase
  await docRegistro.set(json);
}

_addCronogramaPlataformasPc() async {
  final json = {
    'nombre':
        PreferencesCronogramaPlataformas.nombre.toString() + " ".toString(),
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesCronogramaPlataformas.info} ",
    'link': PreferencesCronogramaPlataformas.link,
    'path': PreferencesCronogramaPlataformas.path,
    'fecha': "${PreferencesCronogramaPlataformas.fecha} ",
    'publicacion': "${PreferencesCronogramaPlataformas.publicacion} ",
  };
  await cronogramaPlataformasCollectionPC.add(json);
}
