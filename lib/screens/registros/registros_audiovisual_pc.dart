// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:firedart/firedart.dart';
import 'package:ministerios/widgets/custom_snackbar.dart';

class RegistrosAudiovisualPC extends StatelessWidget {
  const RegistrosAudiovisualPC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Registros de Audiovisual"),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: "Transmisión",
                ),
                Tab(
                  text: "Proyección",
                ),
                Tab(
                  text: "Filmación",
                ),
              ]),
          elevation: 8,
        ),
        body: const TabBarView(
          children: [
            Scrollbar(
              thickness: 8.0,
              child: _RegistroTransmision(),
            ),
            Scrollbar(
              thickness: 8.0,
              child: _RegistroProyeccion(),
            ),
            Scrollbar(
              thickness: 8.0,
              child: _RegistroCamara(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegistroTransmision extends StatefulWidget {
  const _RegistroTransmision({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegistroTransmision> createState() => _RegistroTransmisionState();
}

class _RegistroTransmisionState extends State<_RegistroTransmision> {
  CollectionReference transmisionCollection =
      Firestore.instance.collection('registro_transmision');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<Document>> _getcollection() async {
    List<Document> collectionRegistroTransmision = await transmisionCollection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();

    return collectionRegistroTransmision;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Document>>(
      future: _getcollection(),
      builder: (BuildContext context, AsyncSnapshot<List<Document>> snapshot) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Firestore.instance
                                  .collection("registro_transmision")
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

class _RegistroProyeccion extends StatefulWidget {
  const _RegistroProyeccion({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegistroProyeccion> createState() => _RegistroProyeccionState();
}

class _RegistroProyeccionState extends State<_RegistroProyeccion> {
  CollectionReference proyeccionCollection =
      Firestore.instance.collection('registro_proyeccion');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<Document>> _getcollection() async {
    List<Document> collectionRegistroProyeccion = await proyeccionCollection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();

    return collectionRegistroProyeccion;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Document>>(
      future: _getcollection(),
      builder: (BuildContext context, AsyncSnapshot<List<Document>> snapshot) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Firestore.instance
                                  .collection("registro_proyeccion")
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

class _RegistroCamara extends StatefulWidget {
  const _RegistroCamara({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegistroCamara> createState() => _RegistroCamaraState();
}

class _RegistroCamaraState extends State<_RegistroCamara> {
  CollectionReference camaraCollection =
      Firestore.instance.collection('registro_camara');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<Document>> _getcollection() async {
    List<Document> collectionRegistroCamara = await camaraCollection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();

    return collectionRegistroCamara;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Document>>(
      future: _getcollection(),
      builder: (BuildContext context, AsyncSnapshot<List<Document>> snapshot) {
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
                    if (document["observaciones"] != " ")
                      Text(
                        "Observaciones: " + document["observaciones"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Firestore.instance
                                  .collection("registro_camara")
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
