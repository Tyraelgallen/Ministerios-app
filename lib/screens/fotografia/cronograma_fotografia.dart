// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ministerios/widgets_form/cronograma_fotografia.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

pcfirebase.CollectionReference cronogramaFotografiaCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_cronogramafotografia');

class CrearCronogramaFotografia extends StatefulWidget {
  const CrearCronogramaFotografia({Key? key}) : super(key: key);

  @override
  State<CrearCronogramaFotografia> createState() =>
      _CrearCronogramaFotografiaState();
}

class _CrearCronogramaFotografiaState extends State<CrearCronogramaFotografia> {
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
    final path = 'cronogramafotografia/${pickedFile!.name}';
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
    PreferencesCronogramaFotografia.link = urlDownload;
    PreferencesCronogramaFotografia.path = path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cronograma Fotografía         ")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Crear Nuevo Evento",
              style: TextStyle(fontSize: 25),
            )),
            const SizedBox(height: 10),
            const NameCronogramaFotografia(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const FechaCronogramaFotografia(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const HoraCronogramaFotografia(),
                ),
              ],
            ),
            const InfoCronogramaFotografia(),
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
                                      ? _addCronogramaFotografiaPc()
                                      : _crearRegistroCronogramaFotografia();
                                }
                                PreferencesCronogramaFotografia.nombre = "";
                                PreferencesCronogramaFotografia.fecha = "";
                                PreferencesCronogramaFotografia.horario = "";
                                PreferencesCronogramaFotografia.info = "";
                                PreferencesCronogramaFotografia.link = "";
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

Future _crearRegistroCronogramaFotografia() async {
  final docRegistro = androidfirebase.FirebaseFirestore.instance
      .collection('registro_cronogramafotografia')
      .doc();

  final json = {
    'nombre':
        PreferencesCronogramaFotografia.nombre.toString() + " ".toString(),
    'fecha': "${PreferencesCronogramaFotografia.fecha} ",
    'hora': "${PreferencesCronogramaFotografia.horario} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesCronogramaFotografia.info} ",
    'link': PreferencesCronogramaFotografia.link,
    'path': PreferencesCronogramaFotografia.path,
  };

  //create document and write data to Firebase
  await docRegistro.set(json);
}

_addCronogramaFotografiaPc() async {
  final json = {
    'nombre':
        PreferencesCronogramaFotografia.nombre.toString() + " ".toString(),
    'fecha': "${PreferencesCronogramaFotografia.fecha} ",
    'hora': "${PreferencesCronogramaFotografia.horario} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesCronogramaFotografia.info} ",
    'link': PreferencesCronogramaFotografia.link,
    'path': PreferencesCronogramaFotografia.path,
  };
  await cronogramaFotografiaCollectionPC.add(json);
}
