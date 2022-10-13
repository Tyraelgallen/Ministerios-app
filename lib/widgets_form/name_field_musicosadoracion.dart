import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class SugerenciasMusicosAdoracion extends StatefulWidget {
  const SugerenciasMusicosAdoracion({Key? key}) : super(key: key);

  @override
  State<SugerenciasMusicosAdoracion> createState() =>
      _SugerenciasMusicosAdoracionState();
}

class _SugerenciasMusicosAdoracionState
    extends State<SugerenciasMusicosAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesMusicosAdoracion.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              helperText: "Problemas técnicos, retrasos para comenzar, etc",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesMusicosAdoracion.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class PracticaMusicosAdoracion extends StatefulWidget {
  const PracticaMusicosAdoracion({Key? key}) : super(key: key);

  @override
  State<PracticaMusicosAdoracion> createState() =>
      _PracticaMusicosAdoracionState();
}

class _PracticaMusicosAdoracionState extends State<PracticaMusicosAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesMusicosAdoracion.practica,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Quién no practicó las Canciones',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesMusicosAdoracion.practica = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeMusicosAdoracion extends StatefulWidget {
  const TardeMusicosAdoracion({Key? key}) : super(key: key);

  @override
  State<TardeMusicosAdoracion> createState() => _TardeMusicosAdoracionState();
}

class _TardeMusicosAdoracionState extends State<TardeMusicosAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesMusicosAdoracion.tarde,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesMusicosAdoracion.tarde = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteMusicosAdoracion extends StatefulWidget {
  const AusenteMusicosAdoracion({Key? key}) : super(key: key);

  @override
  State<AusenteMusicosAdoracion> createState() =>
      _AusenteMusicosAdoracionState();
}

class _AusenteMusicosAdoracionState extends State<AusenteMusicosAdoracion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesMusicosAdoracion.ausente,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesMusicosAdoracion.ausente = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Name1Musicos extends StatefulWidget {
  const Name1Musicos({Key? key}) : super(key: key);

  @override
  State<Name1Musicos> createState() => _Name1MusicosState();
}

class _Name1MusicosState extends State<Name1Musicos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesMusicosAdoracion.nombre1,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Persona a cargo de Músicos',
          counterText: "",
          icon: Icon(Icons.group_outlined),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesMusicosAdoracion.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Musicos extends StatefulWidget {
  const Name2Musicos({Key? key}) : super(key: key);

  @override
  State<Name2Musicos> createState() => _Name2MusicosState();
}

class _Name2MusicosState extends State<Name2Musicos> {
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

class Name3Musicos extends StatefulWidget {
  const Name3Musicos({Key? key}) : super(key: key);

  @override
  State<Name3Musicos> createState() => _Name3MusicosState();
}

class _Name3MusicosState extends State<Name3Musicos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesMusicosAdoracion.nombre2,
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
          PreferencesMusicosAdoracion.nombre2 = value;

          setState(() {});
        }),
      ),
    );
  }
}
