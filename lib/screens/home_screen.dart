import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:ministerios/widgets/custom_card.dart';
import 'package:ministerios/widgets/drawer.dart';

bool actualizar = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    setState(() {
      if (actualizar == true) {
        actualizar = false;
        Navigator.pushReplacementNamed(context, "home");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Ministerios Pxlv           ",
          ),
        ),
        elevation: 0,
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        primary: false, //error scroller
        child: Column(
          children: const [
            SizedBox(height: 20),
            _Subtitle(),
            SizedBox(height: 20),
            _Cards(),
          ],
        ),
      ),
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              img: "assets/card1.jpg",
              route: "audiovisual_form",
              labelname: "Audiovisual",
              visible: PreferencesApp.visibleaudiovisual,
            ),
            CustomCard(
              img: "assets/card2.jpg",
              route: "voces_screen",
              labelname: "Voces Adoración",
              visible: PreferencesApp.visiblevoces,
            ),
            CustomCard(
              img: "assets/card5.jpg",
              route: "organizacion_screen",
              labelname: "Organización",
              visible: PreferencesApp.visibleorg,
            ),
            CustomCard(
              img: "assets/card4.jpg",
              route: "fotografia_screen",
              labelname: "Fotografía",
              visible: PreferencesApp.visiblefotografia,
            ),
            CustomCard(
              img: "assets/card8.jpg",
              route: "estetica_screen",
              labelname: "Estética",
              visible: PreferencesApp.visibleestetica,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              img: "assets/card9.jpg",
              route: "sonido_screen",
              labelname: "Sonido",
              visible: PreferencesApp.visiblesonido,
            ),
            CustomCard(
              img: "assets/card6.jpg",
              route: "musicos_screen",
              labelname: "Músicos Adoración",
              visible: PreferencesApp.visiblemusicos,
            ),
            CustomCard(
              img: "assets/card7.jpg",
              route: "calle_screen",
              labelname: "Encargados de Calle",
              visible: PreferencesApp.visiblecalle,
            ),
            CustomCard(
              img: "assets/card3.jpg",
              route: "cena_screen",
              labelname: "Cena del Señor",
              visible: PreferencesApp.visiblecena,
            ),
          ],
        ),
      ],
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Formularios de Ministerios",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
