// ignore_for_file: sized_box_for_whitespace, implementation_imports, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:url_launcher/src/url_launcher_uri.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String fieldpassword = "";
  String fieldmail = "";

  // String mailadmin = "a";
  // String passwordadmin = "a";

  String mailadmin = "admin";
  String passwordadmin = "admin";
  String mailuser = "user";
  String passworduser = "user";
  String mailuser2 = "contactuser";
  String passworduser2 = "contactuser";

  @override
  void initState() {
    PreferencesApp.firstLaunch = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/fondo-login3.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          //color: Colors.green,
          child: Column(
            children: [
              const SizedBox(height: 70),
              const FadeInImage(
                placeholder: AssetImage("assets/pxlv-login.png"),
                image: AssetImage("assets/pxlv-login.png"),
                fit: BoxFit.cover,
                //width: 350,
                //height: 170,
              ),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),

                    labelText: 'Correo Electronico',
                    icon: Icon(Icons.email),
                    //iconColor: Colors.indigo
                  ),
                  onChanged: ((value) {
                    setState(() {
                      fieldmail = value;
                    });
                  }),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),

                    labelText: 'Contraseña',
                    icon: Icon(Icons.lock_outlined),
                    //iconColor: Colors.indigo
                  ),
                  onChanged: ((value) {
                    setState(() {
                      fieldpassword = value;
                    });
                  }),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextFormField(
                  initialValue: PreferencesApp.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),

                    labelText: 'Nombre de Usuario',
                    icon: Icon(Icons.group_outlined),
                    //iconColor: Colors.indigo
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: ((value) {
                    PreferencesApp.name = value;
                    setState(() {});
                  }),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                      onPressed: () {
                        if ((fieldpassword == passwordadmin) &
                            (fieldmail == mailadmin)) {
                          PreferencesApp.firstLaunch = 2;
                          PreferencesApp.contactos = true;
                          Navigator.pushReplacementNamed(context, "home");
                        } else if ((fieldpassword == passworduser) &
                            (fieldmail == mailuser)) {
                          PreferencesApp.firstLaunch = 1;
                          Navigator.pushReplacementNamed(context, "home");
                        } else if ((fieldpassword == passworduser2) &
                            (fieldmail == mailuser2)) {
                          PreferencesApp.firstLaunch = 1;
                          PreferencesApp.contactos = true;
                          Navigator.pushReplacementNamed(context, "home");
                        }
                      },
                      child: const Text("Ingresar")),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                      onPressed: () {
                        PreferencesApp.firstLaunch = 3;
                        Navigator.pushReplacementNamed(context, "home");
                      },
                      child: const Text("Ingresar como invitado")),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () async {
                    const urlpolicy = "https://pxlv.emilioborovski.com/";
                    final uripolicy =
                        Uri.parse("https://pxlv.emilioborovski.com/");
                    if (PreferencesApp.isPcApp == true) {
                      if (await UrlLauncherPlatform.instance
                          .canLaunch(urlpolicy)) {
                        await UrlLauncherPlatform.instance.launch(
                          urlpolicy,
                          useSafariVC: false,
                          useWebView: false,
                          enableJavaScript: false,
                          enableDomStorage: false,
                          universalLinksOnly: false,
                          headers: <String, String>{},
                        );
                      }
                    } else {
                      if (await canLaunchUrl(uripolicy)) {
                        await launchUrl(uripolicy);
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Al ingresar, usted acepta las ",
                      ),
                      Text(
                        "Politicas de Privacidad",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
