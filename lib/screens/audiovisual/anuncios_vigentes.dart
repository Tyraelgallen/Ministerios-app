// ignore_for_file: prefer_interpolation_to_compose_strings, unused_import

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
//import 'package:firebase_storage/firebase_storage.dart' as androidstorage;
//import 'package:firebase_storage_web/firebase_storage_web.dart' as pcstorage;

final _snackBar = SnackBar(
  content: Row(
    children: const [
      Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
      SizedBox(width: 10),
      Text(
        "Anuncio Borrado",
        style: TextStyle(fontSize: 15),
      ),
    ],
  ),
  duration: const Duration(seconds: 2),
);

class AnunciosVigentes extends StatelessWidget {
  const AnunciosVigentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Anuncios Vigentes     ")),
        actions: [
          PreferencesApp.firstLaunch == 2 && PreferencesApp.isPcApp == false
              ? IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, "crear_anuncio_audiovisual");
                    if (PreferencesApp.isPcApp == false) {
                      Navigator.pushNamed(context, "crear_anuncio_audiovisual");
                    }
                  },
                  icon: const Icon(Icons.add))
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          const SizedBox(width: 10),
        ],
      ),
      body: PreferencesApp.isPcApp == true
          ? const _AnunciosPC()
          : const _AnunciosAndroid(),
    );
  }
}

class _AnunciosPC extends StatefulWidget {
  const _AnunciosPC({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnunciosPC> createState() => _AnunciosPCState();
}

class _AnunciosPCState extends State<_AnunciosPC> {
  pcfirebase.CollectionReference anunciosCollection =
      pcfirebase.Firestore.instance.collection('registro_anuncios');

  @override
  void initState() {
    _getcollection();
    super.initState();
  }

  Future<List<Document>> _getcollection() async {
    List<Document> collectionRegistroTransmision = await anunciosCollection
        .orderBy('fechadecreacion', descending: true)
        .limit(100)
        .get();
    //print(collection_registro_anuncios);
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          child: FadeInImage(
                              placeholder: NetworkImage(document["link"]),
                              image: NetworkImage(document["link"]))),
                    ),
                    if (document["nombre"] != " ")
                      Text(
                        "Nombre: " + document["nombre"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["fecha"] != " ")
                      Text(
                        "Fecha: " + document["fecha"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["hora"] != " ")
                      Text(
                        "Hora: " + document["hora"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["info"] != " ")
                      Text(
                        "Info: " + document["info"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    PreferencesApp.firstLaunch == 2
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    pcfirebase.Firestore.instance
                                        .collection("registro_anuncios")
                                        .document(document.id)
                                        .delete();
                                    //FirebaseStorage.instance
                                    //  .ref()
                                    //.child(document["path"])
                                    //.delete();
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
                          )
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

class _AnunciosAndroid extends StatefulWidget {
  const _AnunciosAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnunciosAndroid> createState() => _AnunciosAndroidState();
}

class _AnunciosAndroidState extends State<_AnunciosAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_anuncios')
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
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          child: FadeInImage(
                              placeholder: NetworkImage(document["link"]),
                              image: NetworkImage(document["link"]))),
                    ),
                    if (document["nombre"] != " ")
                      Text(
                        "Nombre: " + document["nombre"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["fecha"] != " ")
                      Text(
                        "Fecha: " + document["fecha"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["hora"] != " ")
                      Text(
                        "Hora: " + document["hora"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 2),
                    if (document["info"] != " ")
                      Text(
                        "Info: " + document["info"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    PreferencesApp.firstLaunch == 2
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
                                        .collection("registro_anuncios")
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
                          )
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
