// ignore_for_file: unused_import, implementation_imports, depend_on_referenced_packages

import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/src/url_launcher_uri.dart';

final _snackBar = SnackBar(
  content: Row(
    children: const [
      Icon(
        Icons.delete_forever,
        color: Colors.white,
      ),
      SizedBox(width: 10),
      Text(
        "Tutorial Borrado",
        style: TextStyle(fontSize: 15),
      ),
    ],
  ),
  duration: const Duration(seconds: 2),
);

class TutorialesAudiovisual extends StatelessWidget {
  const TutorialesAudiovisual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Tutoriales            "),
        ),
        actions: [
          PreferencesApp.firstLaunch == 2
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "crear_tutorial_audiovisual");
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
          ? const _TutorialesPC()
          : const _TutorialesAndroid(),
    );
  }
}

class _TutorialesPC extends StatefulWidget {
  const _TutorialesPC({
    Key? key,
  }) : super(key: key);

  @override
  State<_TutorialesPC> createState() => _TutorialesPCState();
}

class _TutorialesPCState extends State<_TutorialesPC> {
  pcfirebase.CollectionReference transmisionCollection =
      pcfirebase.Firestore.instance.collection('registro_tutorial');

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
                      "Nombre: ${document["nombre"]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Info: ${document["info"]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              String urligle = document["link"];
                              final uriigle = Uri.parse(document["link"]);
                              if (PreferencesApp.isPcApp == true) {
                                if (await UrlLauncherPlatform.instance
                                    .canLaunch(urligle)) {
                                  await UrlLauncherPlatform.instance.launch(
                                    urligle,
                                    useSafariVC: false,
                                    useWebView: false,
                                    enableJavaScript: false,
                                    enableDomStorage: false,
                                    universalLinksOnly: false,
                                    headers: <String, String>{},
                                  );
                                }
                              } else {
                                if (await canLaunchUrl(uriigle)) {
                                  await launchUrl(uriigle);
                                }
                              }
                            },
                            icon: const Icon(Icons.link)),
                        PreferencesApp.firstLaunch == 2
                            ? IconButton(
                                onPressed: () {
                                  pcfirebase.Firestore.instance
                                      .collection("registro_tutorial")
                                      .document(document.id)
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
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              )
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

class _TutorialesAndroid extends StatefulWidget {
  const _TutorialesAndroid({
    Key? key,
  }) : super(key: key);

  @override
  State<_TutorialesAndroid> createState() => _TutorialesAndroidState();
}

class _TutorialesAndroidState extends State<_TutorialesAndroid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: androidfirebase.FirebaseFirestore.instance
          .collection('registro_tutorial')
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
                      "Nombre: ${document["nombre"]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Info: ${document["info"]}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () async {
                              String urligle = document["link"];
                              final uriigle = Uri.parse(document["link"]);
                              if (PreferencesApp.isPcApp == true) {
                                if (await UrlLauncherPlatform.instance
                                    .canLaunch(urligle)) {
                                  await UrlLauncherPlatform.instance.launch(
                                    urligle,
                                    useSafariVC: false,
                                    useWebView: false,
                                    enableJavaScript: false,
                                    enableDomStorage: false,
                                    universalLinksOnly: false,
                                    headers: <String, String>{},
                                  );
                                }
                              } else {
                                if (await canLaunchUrl(uriigle)) {
                                  await launchUrl(uriigle);
                                }
                              }
                            },
                            icon: const Icon(Icons.link)),
                        PreferencesApp.firstLaunch == 2
                            ? IconButton(
                                onPressed: () {
                                  androidfirebase.FirebaseFirestore.instance
                                      .collection("registro_tutorial")
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
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              )
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
