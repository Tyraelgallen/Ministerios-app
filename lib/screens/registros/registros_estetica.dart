// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/custom_snackbar.dart';

class RegistroEstetica extends StatelessWidget {
  const RegistroEstetica({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de Estética"),
      ),
      body: PreferencesApp.isPcApp == true
          ? const RegistroEsteticaPC()
          : const RegistroEsteticaAndroid(),
    );
  }
}

class RegistroEsteticaAndroid extends StatefulWidget {
  const RegistroEsteticaAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroEsteticaAndroid> createState() =>
      _RegistroEsteticaAndroidState();
}

class _RegistroEsteticaAndroidState extends State<RegistroEsteticaAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_estetica')
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
                      "Nombre: " + document["nombre"],
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
                                  .collection("registro_estetica")
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

class RegistroEsteticaPC extends StatefulWidget {
  const RegistroEsteticaPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroEsteticaPC> createState() => RegistroEsteticaPCState();
}

class RegistroEsteticaPCState extends State<RegistroEsteticaPC> {
  pcfirebase.CollectionReference camaraCollection =
      pcfirebase.Firestore.instance.collection('registro_estetica');

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
                      "Nombre: " + document["nombre"],
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
                                  .collection("registro_estetica")
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
