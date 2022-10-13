// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/preferencesapp.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/custom_snackbar.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contactos Agregados"),
      ),
      body: PreferencesApp.isPcApp == true
          ? const RegistroContactoPC()
          : const RegistroContactoAndroid(),
    );
  }
}

class RegistroContactoAndroid extends StatefulWidget {
  const RegistroContactoAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroContactoAndroid> createState() =>
      _RegistroContactoAndroidState();
}

class _RegistroContactoAndroidState extends State<RegistroContactoAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_contacto')
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
                      "Número: " + document["numero"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Info: " + document["info"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              androidfirebase.FirebaseFirestore.instance
                                  .collection("registro_contacto")
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

class RegistroContactoPC extends StatefulWidget {
  const RegistroContactoPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroContactoPC> createState() => RegistroContactoPCState();
}

class RegistroContactoPCState extends State<RegistroContactoPC> {
  pcfirebase.CollectionReference camaraCollection =
      pcfirebase.Firestore.instance.collection('registro_contacto');

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
                      "Número: " + document["numero"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    if (document["info"] != " ")
                      Text(
                        "Info: " + document["info"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              pcfirebase.Firestore.instance
                                  .collection("registro_contacto")
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
