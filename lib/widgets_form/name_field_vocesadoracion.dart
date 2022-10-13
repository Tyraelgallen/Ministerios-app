import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class SugerenciasVocesAdoracion extends StatefulWidget {
  const SugerenciasVocesAdoracion({Key? key}) : super(key: key);

  @override
  State<SugerenciasVocesAdoracion> createState() =>
      _SugerenciasVocesAdoracionState();
}

class _SugerenciasVocesAdoracionState extends State<SugerenciasVocesAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesVocesAdoracion.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesVocesAdoracion.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeVocesAdoracion extends StatefulWidget {
  const TardeVocesAdoracion({Key? key}) : super(key: key);

  @override
  State<TardeVocesAdoracion> createState() => _TardeVocesAdoracionState();
}

class _TardeVocesAdoracionState extends State<TardeVocesAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesVocesAdoracion.tarde,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesVocesAdoracion.tarde = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteVocesAdoracion extends StatefulWidget {
  const AusenteVocesAdoracion({Key? key}) : super(key: key);

  @override
  State<AusenteVocesAdoracion> createState() => _AusenteVocesAdoracionState();
}

class _AusenteVocesAdoracionState extends State<AusenteVocesAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesVocesAdoracion.ausente,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesVocesAdoracion.ausente = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Name1Voces extends StatefulWidget {
  const Name1Voces({Key? key}) : super(key: key);

  @override
  State<Name1Voces> createState() => _Name1VocesState();
}

class _Name1VocesState extends State<Name1Voces> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesVocesAdoracion.nombre1,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Persona a cargo de las voces',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesVocesAdoracion.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Voces extends StatefulWidget {
  const Name2Voces({Key? key}) : super(key: key);

  @override
  State<Name2Voces> createState() => _Name2VocesState();
}

class _Name2VocesState extends State<Name2Voces> {
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

          labelText: 'Persona a cargo del llenado de la planilla',
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

class Name3Voces extends StatefulWidget {
  const Name3Voces({Key? key}) : super(key: key);

  @override
  State<Name3Voces> createState() => _Name3VocesState();
}

class _Name3VocesState extends State<Name3Voces> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesVocesAdoracion.nombre2,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Persona a cargo del orden',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesVocesAdoracion.nombre2 = value;

          setState(() {});
        }),
      ),
    );
  }
}
