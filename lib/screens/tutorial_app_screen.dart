// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/src/url_launcher_uri.dart';
import 'package:ministerios/shared_pref/preferencesapp.dart';

class TutorialApp extends StatelessWidget {
  const TutorialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Informacion           ")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.green,
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      //TODO your video tutorials
                      String urligle =
                          "";
                      Uri uriigle = Uri.parse(
                          "");
                      if (PreferencesApp.firstLaunch == 2) {
                        urligle = "";
                        uriigle = Uri.parse(
                            "");
                      }

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
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/facebook.jpg"),
                      radius: 100,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: const [
                  Text(
                    "Esta aplicacion fue creada con el fin de facilitar tanto el llenado de formularios por parte de los ministerios, como tambien el propio servicio en sí",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Clickeando la imagen circular de arriba, podras acceder al video de youtube que explica de manera general el funcionamiento de la aplicacion en su totalidad",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Cualquier duda sobre alguna caracteristica de la app, o reporte de algún mal funcionamiento, comunicarse al siguiente mail:",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
