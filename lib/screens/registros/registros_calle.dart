// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/custom_snackbar.dart';

class RegistroCalle extends StatelessWidget {
  const RegistroCalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de Calle"),
      ),
      body: PreferencesApp.isPcApp == true
          ? const RegistroCallePC()
          : const RegistroCalleAndroid(),
    );
  }
}

class RegistroCalleAndroid extends StatefulWidget {
  const RegistroCalleAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroCalleAndroid> createState() => _RegistroCalleAndroidState();
}

class _RegistroCalleAndroidState extends State<RegistroCalleAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_calle')
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
                      "Capitán a cargo: " + document["capitan"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Encargado de Calle: " + document["nombre"],
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
                      "Vehiculo: " +
                          document["nombre3"] +
                          "| Conductor: " +
                          document["nombre4"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre5"] +
                          "| Conductor: " +
                          document["nombre6"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre7"] +
                          "| Conductor: " +
                          document["nombre8"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre9"] +
                          "| Conductor: " +
                          document["nombre10"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre11"] +
                          "| Conductor: " +
                          document["nombre12"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre13"] +
                          "| Conductor: " +
                          document["nombre14"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre15"] +
                          "| Conductor: " +
                          document["nombre16"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              androidfirebase.FirebaseFirestore.instance
                                  .collection("registro_calle")
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

class RegistroCallePC extends StatefulWidget {
  const RegistroCallePC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroCallePC> createState() => RegistroCallePCState();
}

class RegistroCallePCState extends State<RegistroCallePC> {
  pcfirebase.CollectionReference camaraCollection =
      pcfirebase.Firestore.instance.collection('registro_calle');

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
                      "Capitán a cargo: " + document["capitan"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Encargado de Calle: " + document["nombre"],
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
                      "Vehiculo: " +
                          document["nombre3"] +
                          "| Conductor: " +
                          document["nombre4"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre5"] +
                          "| Conductor: " +
                          document["nombre6"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre7"] +
                          "| Conductor: " +
                          document["nombre8"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Vehiculo: " +
                          document["nombre9"] +
                          "| Conductor: " +
                          document["nombre10"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre11"] +
                          "| Conductor: " +
                          document["nombre12"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre13"] +
                          "| Conductor: " +
                          document["nombre14"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Moto/bicicleta: " +
                          document["nombre15"] +
                          "| Conductor: " +
                          document["nombre16"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              pcfirebase.Firestore.instance
                                  .collection("registro_calle")
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
