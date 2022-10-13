// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/custom_snackbar.dart';

class RegistroFotografia extends StatelessWidget {
  const RegistroFotografia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de Fotografia"),
      ),
      body: PreferencesApp.isPcApp == true
          ? const RegistroFotografiaPC()
          : const RegistroFotografiaAndroid(),
    );
  }
}

class RegistroFotografiaAndroid extends StatefulWidget {
  const RegistroFotografiaAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroFotografiaAndroid> createState() =>
      _RegistroFotografiaAndroidState();
}

class _RegistroFotografiaAndroidState extends State<RegistroFotografiaAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_fotografia')
          .orderBy('fechadecreacion', descending: true)
          .limit(100)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<androidfirebase.QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final docum = snapshot.data!.docs;
        return ListView(
          children: docum.map((document) {
            return Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Fotógrafo: " + document["nombre"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Servicio: " + document["servicio"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha: " +
                          document["dia"] +
                          document["fecha"] +
                          document["hora"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha de Servicio: " + document["nombre1"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha de Envío: " + document["nombre2"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos sacadas: " + document["nombre3"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos Editadas: " + document["nombre5"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos Enviadas: " + document["nombre6"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Observaciones: " + document["observaciones"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              androidfirebase.FirebaseFirestore.instance
                                  .collection("registro_fotografia")
                                  .doc(document.id)
                                  .delete();
                              Future.delayed(const Duration(milliseconds: 200),
                                  () {
                                setState(() {});
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(customSnackDeleteRegistro());
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class RegistroFotografiaPC extends StatefulWidget {
  const RegistroFotografiaPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroFotografiaPC> createState() => RegistroFotografiaPCState();
}

class RegistroFotografiaPCState extends State<RegistroFotografiaPC> {
  pcfirebase.CollectionReference camaraCollection =
      pcfirebase.Firestore.instance.collection('registro_fotografia');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<pcfirebase.Document>> _getcollection() async {
    List<pcfirebase.Document> collectionRegistroCamara = await camaraCollection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();

    return collectionRegistroCamara;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<pcfirebase.Document>>(
      future: _getcollection(),
      builder: (BuildContext context,
          AsyncSnapshot<List<pcfirebase.Document>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.map((document) {
            return Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Fotógrafo: " + document["nombre"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Servicio: " + document["servicio"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha: " +
                          document["dia"] +
                          document["fecha"] +
                          document["hora"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha de Servicio: " + document["nombre1"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fecha de Envío: " + document["nombre2"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos sacadas: " + document["nombre3"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos Editadas: " + document["nombre5"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Fotos Enviadas: " + document["nombre6"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Observaciones: " + document["observaciones"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              pcfirebase.Firestore.instance
                                  .collection("registro_fotografia")
                                  .document(document.id)
                                  .delete();
                              Future.delayed(const Duration(milliseconds: 200),
                                  () {
                                setState(() {});
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(customSnackDeleteRegistro());
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
