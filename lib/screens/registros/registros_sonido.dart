// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/custom_snackbar.dart';

class RegistroSonido extends StatelessWidget {
  const RegistroSonido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de Sonido"),
      ),
      body: PreferencesApp.isPcApp == true
          ? const RegistroSonidoPC()
          : const RegistroSonidoAndroid(),
    );
  }
}

class RegistroSonidoAndroid extends StatefulWidget {
  const RegistroSonidoAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroSonidoAndroid> createState() => _RegistroSonidoAndroidState();
}

class _RegistroSonidoAndroidState extends State<RegistroSonidoAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_sonido')
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
                      "A cargo: " + document["nombre"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Llenado de planilla y Orden: " + document["nombre1"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Colaboradores: " + document["nombre2"],
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
                    if (document["ausente"] != " ")
                      Text(
                        "Ausentes sin aviso: " + document["ausente"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["tarde"] != " ")
                      Text(
                        "Tarde sin aviso: " + document["tarde"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["observaciones"] != " ")
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
                                  .collection("registro_sonido")
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

class RegistroSonidoPC extends StatefulWidget {
  const RegistroSonidoPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroSonidoPC> createState() => RegistroSonidoPCState();
}

class RegistroSonidoPCState extends State<RegistroSonidoPC> {
  pcfirebase.CollectionReference camaraCollection =
      pcfirebase.Firestore.instance.collection('registro_sonido');

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
                      "A cargo: " + document["nombre"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Llenado de planilla y Orden: " + document["nombre1"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Colaboradores: " + document["nombre2"],
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
                    if (document["ausente"] != " ")
                      Text(
                        "Ausentes sin aviso: " + document["ausente"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["tarde"] != " ")
                      Text(
                        "Tarde sin aviso: " + document["tarde"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["observaciones"] != " ")
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
                                  .collection("registro_sonido")
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
