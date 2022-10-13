import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class SugerenciasSantaCena extends StatefulWidget {
  const SugerenciasSantaCena({Key? key}) : super(key: key);

  @override
  State<SugerenciasSantaCena> createState() => _SugerenciasSantaCenaState();
}

class _SugerenciasSantaCenaState extends State<SugerenciasSantaCena> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSantaCena.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              helperText: "Mejoras posibles, problemas, soluciones, etc",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSantaCena.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeSantaCena extends StatefulWidget {
  const TardeSantaCena({Key? key}) : super(key: key);

  @override
  State<TardeSantaCena> createState() => _TardeSantaCenaState();
}

class _TardeSantaCenaState extends State<TardeSantaCena> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSantaCena.tardename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSantaCena.tardename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteSantaCena extends StatefulWidget {
  const AusenteSantaCena({Key? key}) : super(key: key);

  @override
  State<AusenteSantaCena> createState() => _AusenteSantaCenaState();
}

class _AusenteSantaCenaState extends State<AusenteSantaCena> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesSantaCena.ausentename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesSantaCena.ausentename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Name1SantaCena extends StatefulWidget {
  const Name1SantaCena({Key? key}) : super(key: key);

  @override
  State<Name1SantaCena> createState() => _Name1SantaCenaState();
}

class _Name1SantaCenaState extends State<Name1SantaCena> {
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

          labelText: 'Persona a cargo de la Santa Cena',
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

class Name2SantaCena extends StatefulWidget {
  const Name2SantaCena({Key? key}) : super(key: key);

  @override
  State<Name2SantaCena> createState() => _Name2SantaCenaState();
}

class _Name2SantaCenaState extends State<Name2SantaCena> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesSantaCena.nombre1,
        minLines: 1,
        maxLines: 10,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

          labelText: 'Hoy Sirven:',
          counterText: "",

          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesSantaCena.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Copas1 extends StatefulWidget {
  const Copas1({Key? key}) : super(key: key);

  @override
  State<Copas1> createState() => _Copas1State();
}

class _Copas1State extends State<Copas1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        initialValue: PreferencesSantaCena.nombre2,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'N° Copas Servidas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          setState(() {
            PreferencesSantaCena.nombre2 = value;
          });
        }),
      ),
    );
  }
}

class Copas2 extends StatefulWidget {
  const Copas2({Key? key}) : super(key: key);

  @override
  State<Copas2> createState() => _Copas2State();
}

class _Copas2State extends State<Copas2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        initialValue: PreferencesSantaCena.nombre3,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: 'N° Bandejas',
          counterText: "",

          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          setState(() {
            PreferencesSantaCena.nombre3 = value;
          });
        }),
      ),
    );
  }
}

class Copas3 extends StatefulWidget {
  const Copas3({Key? key}) : super(key: key);

  @override
  State<Copas3> createState() => _Copas3State();
}

class _Copas3State extends State<Copas3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesSantaCena.nombre4,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: 'Copas Restantes',
          counterText: "",
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          setState(() {
            PreferencesSantaCena.nombre4 = value;
          });
        }),
      ),
    );
  }
}

class Copas4 extends StatefulWidget {
  const Copas4({Key? key}) : super(key: key);

  @override
  State<Copas4> createState() => _Copas4State();
}

class _Copas4State extends State<Copas4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesSantaCena.nombre5,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: 'Cantidad de Copas Consumidas',
          counterText: "",
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesSantaCena.nombre5 = value;

          setState(() {});
        }),
      ),
    );
  }
}
