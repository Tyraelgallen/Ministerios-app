// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class AudiovisualForm extends StatefulWidget {
  const AudiovisualForm({Key? key}) : super(key: key);

  @override
  State<AudiovisualForm> createState() => _AudiovisualFormState();
}

class _AudiovisualFormState extends State<AudiovisualForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Ministerio de Audiovisual         ")),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        primary: false,
        child:
            PreferencesApp.firstLaunch == 1 || PreferencesApp.firstLaunch == 2
                ? Column(
                    children: const [
                      cardtransm(),
                      SizedBox(height: 15),
                      cardproyec(),
                      SizedBox(height: 15),
                      cardcam(),
                      SizedBox(height: 15),
                      // cardanuncios(),
                      // SizedBox(height: 15),
                      // cardtutos(),
                      // SizedBox(height: 15),
                    ],
                  )
                : Column(
                    children: const [
                      cardtransm(),
                      SizedBox(height: 15),
                      cardproyec(),
                      SizedBox(height: 15),
                      cardcam(),
                      SizedBox(height: 15),
                    ],
                  ),
      ),
    );
  }
}

class cardtransm extends StatelessWidget {
  const cardtransm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "transmision_screen"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/card-audiovisual-1-1.jpg"),
                image: AssetImage("assets/card-audiovisual-1-1.jpg"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Transmisión",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class cardproyec extends StatelessWidget {
  const cardproyec({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "proyeccion_screen"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/card-audiovisual-1-2.jpg"),
                image: AssetImage("assets/card-audiovisual-1-2.jpg"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Proyección",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class cardcam extends StatelessWidget {
  const cardcam({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "camara_screen"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/card-audiovisual-1-3.jpg"),
                image: AssetImage("assets/card-audiovisual-1-3.jpg"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Filmación",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class cardanuncios extends StatelessWidget {
  const cardanuncios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "anuncios_vigentes"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/card-audiovisual-1-4.jpg"),
                image: AssetImage("assets/card-audiovisual-1-4.jpg"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Anuncios",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class cardtutos extends StatelessWidget {
  const cardtutos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "tutoriales_audiovisual"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/card-audiovisual-1-5.jpg"),
                image: AssetImage("assets/card-audiovisual-1-5.jpg"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Tutoriales",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
