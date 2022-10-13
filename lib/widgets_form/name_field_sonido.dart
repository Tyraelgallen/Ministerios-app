import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class SugerenciasSonido extends StatefulWidget {
  const SugerenciasSonido({Key? key}) : super(key: key);

  @override
  State<SugerenciasSonido> createState() => _SugerenciasSonidoState();
}

class _SugerenciasSonidoState extends State<SugerenciasSonido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSonido.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              helperText:
                  "Pedidos especial de Adoración, problemas, discusiones, etc",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSonido.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeSonido extends StatefulWidget {
  const TardeSonido({Key? key}) : super(key: key);

  @override
  State<TardeSonido> createState() => _TardeSonidoState();
}

class _TardeSonidoState extends State<TardeSonido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSonido.tardename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSonido.tardename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteSonido extends StatefulWidget {
  const AusenteSonido({Key? key}) : super(key: key);

  @override
  State<AusenteSonido> createState() => _AusenteSonidoState();
}

class _AusenteSonidoState extends State<AusenteSonido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSonido.ausentename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSonido.ausentename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Name1Sonido extends StatefulWidget {
  const Name1Sonido({Key? key}) : super(key: key);

  @override
  State<Name1Sonido> createState() => _Name1SonidoState();
}

class _Name1SonidoState extends State<Name1Sonido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesSonido.nombre1,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Persona a cargo de Sonido',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesSonido.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Sonido extends StatefulWidget {
  const Name2Sonido({Key? key}) : super(key: key);

  @override
  State<Name2Sonido> createState() => _Name2SonidoState();
}

class _Name2SonidoState extends State<Name2Sonido> {
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

          labelText: 'Persona a cargo del llenado de la planilla y del orden',
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

class Name3Sonido extends StatefulWidget {
  const Name3Sonido({Key? key}) : super(key: key);

  @override
  State<Name3Sonido> createState() => _Name3SonidoState();
}

class _Name3SonidoState extends State<Name3Sonido> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesSonido.nombre2,
        minLines: 1,
        maxLines: 10,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Colaboradores',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesSonido.nombre2 = value;

          setState(() {});
        }),
      ),
    );
  }
}
