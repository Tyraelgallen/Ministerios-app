// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, depend_on_referenced_packages, implementation_imports

import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _snackBar = SnackBar(
  content: Row(
    children: const [
      Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
      SizedBox(width: 10),
      Text(
        "Archivo Borrado",
        style: TextStyle(fontSize: 15),
      ),
    ],
  ),
  duration: const Duration(seconds: 2),
);

class RegistroPlataformasPC extends StatefulWidget {
  const RegistroPlataformasPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroPlataformasPC> createState() => RegistroPlataformasPCState();
}

class RegistroPlataformasPCState extends State<RegistroPlataformasPC> {
  pcfirebase.CollectionReference collection = pcfirebase.Firestore.instance
      .collection('registro_cronogramaplataformas');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<pcfirebase.Document>> _getcollection() async {
    List<pcfirebase.Document> collectionRegistro = await collection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();
    return collectionRegistro;
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
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: snapshot.data!.map((document) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        color: Colors.blue[100],
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: NetworkImage(document["link"]),
                            image: NetworkImage(document["link"]))),
                    if (document["nombre"] != " ")
                      Text(
                        "Nombre: ${document["nombre"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["fecha"] != " ")
                      Text(
                        "Fecha de Ingreso: ${document["fecha"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["publicacion"] != " ")
                      Text(
                        "Fechas de Publicación: ${document["publicacion"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["info"] != " ")
                      Text(
                        "Info: ${document["info"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    (PreferencesApp.firstLaunch == 2) &
                            (PreferencesApp.isPcApp == false)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    /*
                                    FirebaseStorage.instance
                                        .ref()
                                        .child(document["path"])
                                        .delete();
                                    pcfirebase.Firestore.instance
                                        .collection(
                                            "registro_cronogramaplataformas")
                                        .document(document.id)
                                        .delete();
                                        */
                                    Future.delayed(
                                        const Duration(milliseconds: 200), () {
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(_snackBar);
                                    });
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
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

class RegistroPlataformasAndroid extends StatefulWidget {
  const RegistroPlataformasAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroPlataformasAndroid> createState() =>
      RegistroPlataformasAndroidState();
}

class RegistroPlataformasAndroidState
    extends State<RegistroPlataformasAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_cronogramaplataformas')
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
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: docum.map((document) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        color: Colors.blue[100],
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: NetworkImage(document["link"]),
                            image: NetworkImage(document["link"]))),
                    if (document["nombre"] != " ")
                      Text(
                        "Nombre: ${document["nombre"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["fecha"] != " ")
                      Text(
                        "Fecha de Ingreso: ${document["fecha"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["publicacion"] != " ")
                      Text(
                        "Fechas de Publicación: ${document["publicacion"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["info"] != " ")
                      Text(
                        "Info: ${document["info"]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    (PreferencesApp.firstLaunch == 2) &
                            (PreferencesApp.isPcApp == false)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    FirebaseStorage.instance
                                        .ref()
                                        .child(document["path"])
                                        .delete();
                                    androidfirebase.FirebaseFirestore.instance
                                        .collection(
                                            "registro_cronogramaplataformas")
                                        .doc(document.id)
                                        .delete();
                                    Future.delayed(
                                        const Duration(milliseconds: 200), () {
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(_snackBar);
                                    });
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
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
