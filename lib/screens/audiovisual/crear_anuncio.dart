// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ministerios/widgets_form/anuncio_audiovisual.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

pcfirebase.CollectionReference anuncioCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_anuncios');

class CrearAnuncio extends StatefulWidget {
  const CrearAnuncio({Key? key}) : super(key: key);

  @override
  State<CrearAnuncio> createState() => _CrearAnuncioState();
}

class _CrearAnuncioState extends State<CrearAnuncio> {
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
    final path = 'audiovisualanuncios/${pickedFile!.name}';
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
    PreferencesAnuncioAudiovisual.link = urlDownload;
    PreferencesAnuncioAudiovisual.path = path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Nuevo Anuncio         ")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Crear Nuevo Anuncio",
              style: TextStyle(fontSize: 30),
            )),
            const SizedBox(height: 10),
            const NameAnuncio(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const FechaAnuncio(),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const HoraAnuncio(),
                ),
              ],
            ),
            const InfoAnuncio(),
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
                ? const CircularProgressIndicator()
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
                                      ? _addAnuncioPc()
                                      : _crearRegistroAnuncio();
                                }
                                PreferencesAnuncioAudiovisual.nombre = "";
                                PreferencesAnuncioAudiovisual.fecha = "";
                                PreferencesAnuncioAudiovisual.horario = "";
                                PreferencesAnuncioAudiovisual.info = "";
                                PreferencesAnuncioAudiovisual.link = "";
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Crear Anuncio")),
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

Future _crearRegistroAnuncio() async {
  final docRegistro = androidfirebase.FirebaseFirestore.instance
      .collection('registro_anuncios')
      .doc();

  final json = {
    'nombre': "${PreferencesAnuncioAudiovisual.nombre} ",
    'fecha': "${PreferencesAnuncioAudiovisual.fecha} ",
    'hora': "${PreferencesAnuncioAudiovisual.horario} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesAnuncioAudiovisual.info} ",
    'link': PreferencesAnuncioAudiovisual.link,
    'path': PreferencesAnuncioAudiovisual.path,
  };

  //create document and write data to Firebase
  await docRegistro.set(json);
}

_addAnuncioPc() async {
  final json = {
    'nombre': "${PreferencesAnuncioAudiovisual.nombre} ",
    'fecha': "${PreferencesAnuncioAudiovisual.fecha} ",
    'hora': "${PreferencesAnuncioAudiovisual.horario} ",
    'fechadecreacion': DateTime.now().toString(),
    'info': "${PreferencesAnuncioAudiovisual.info} ",
    'link': PreferencesAnuncioAudiovisual.link,
    'path': PreferencesAnuncioAudiovisual.path,
  };
  await anuncioCollectionPC.add(json);
}

Widget uploadProgress(UploadTask uploadTask) => StreamBuilder<TaskSnapshot>(
    stream: uploadTask.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        return Text("$progress");
      } else {
        return Container();
      }
    });
