// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegistroFotografiaPC extends StatefulWidget {
  const RegistroFotografiaPC({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroFotografiaPC> createState() => RegistroFotografiaPCState();
}

class RegistroFotografiaPCState extends State<RegistroFotografiaPC> {
  pcfirebase.CollectionReference collection =
      pcfirebase.Firestore.instance.collection('registro_cronogramafotografia');

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
    //print(collection_registro_fotografia);
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
            return Column(
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
                (PreferencesApp.firstLaunch == 2) &
                        (PreferencesApp.isPcApp == false)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                /*
                                pcfirebase.Firestore.instance
                                    .collection("registro_cronogramafotografia")
                                    .document(document.id)
                                    .delete();
                                    */
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {});
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(customSnackDeleteRegistro());
                                });
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                const Divider(),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}

class RegistroFotografiaAndroid extends StatefulWidget {
  const RegistroFotografiaAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistroFotografiaAndroid> createState() =>
      RegistroFotografiaAndroidState();
}

class RegistroFotografiaAndroidState extends State<RegistroFotografiaAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_cronogramafotografia')
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
            return Column(
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
                                    .collection("registro_cronogramafotografia")
                                    .doc(document.id)
                                    .delete();
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {});
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(customSnackDeleteRegistro());
                                });
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                const Divider(),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
