import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class SugerenciasEstetica extends StatefulWidget {
  const SugerenciasEstetica({Key? key}) : super(key: key);

  @override
  State<SugerenciasEstetica> createState() => _SugerenciasEsteticaState();
}

class _SugerenciasEsteticaState extends State<SugerenciasEstetica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesEstetica.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              helperText: "Necesidades a solucionar",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesEstetica.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeEstetica extends StatefulWidget {
  const TardeEstetica({Key? key}) : super(key: key);

  @override
  State<TardeEstetica> createState() => _TardeEsteticaState();
}

class _TardeEsteticaState extends State<TardeEstetica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesEstetica.tardename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesEstetica.tardename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteEstetica extends StatefulWidget {
  const AusenteEstetica({Key? key}) : super(key: key);

  @override
  State<AusenteEstetica> createState() => _AusenteEsteticaState();
}

class _AusenteEsteticaState extends State<AusenteEstetica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesEstetica.ausentename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesEstetica.ausentename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Name1Estetica extends StatefulWidget {
  const Name1Estetica({Key? key}) : super(key: key);

  @override
  State<Name1Estetica> createState() => _Name1EsteticaState();
}

class _Name1EsteticaState extends State<Name1Estetica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesApp.name,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Persona a cargo',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesApp.name = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Estetica extends StatefulWidget {
  const Name2Estetica({Key? key}) : super(key: key);

  @override
  State<Name2Estetica> createState() => _Name2EsteticaState();
}

class _Name2EsteticaState extends State<Name2Estetica> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesEstetica.nombre1,
        minLines: 1,
        maxLines: 10,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          labelText: 'Hoy Sirven',
          counterText: "",

          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesEstetica.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}
