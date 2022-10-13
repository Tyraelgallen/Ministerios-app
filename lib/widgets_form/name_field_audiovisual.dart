import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class NameFieldInput1 extends StatefulWidget {
  const NameFieldInput1({Key? key}) : super(key: key);

  @override
  State<NameFieldInput1> createState() => _NameFieldInput1State();
}

class _NameFieldInput1State extends State<NameFieldInput1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesApp.name,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Nombre',
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

class AusenteNameFieldInput extends StatefulWidget {
  const AusenteNameFieldInput({Key? key}) : super(key: key);

  @override
  State<AusenteNameFieldInput> createState() => _AusenteNameFieldInputState();
}

class _AusenteNameFieldInputState extends State<AusenteNameFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesTransmision.ausentename,
            minLines: 1,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesTransmision.ausentename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeNameFieldInput extends StatefulWidget {
  const TardeNameFieldInput({Key? key}) : super(key: key);

  @override
  State<TardeNameFieldInput> createState() => _TardeNameFieldInputState();
}

class _TardeNameFieldInputState extends State<TardeNameFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesTransmision.tardename,
            minLines: 1,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesTransmision.tardename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class SugerenciasFieldInput1 extends StatefulWidget {
  const SugerenciasFieldInput1({Key? key}) : super(key: key);

  @override
  State<SugerenciasFieldInput1> createState() => _SugerenciasFieldInput1State();
}

class _SugerenciasFieldInput1State extends State<SugerenciasFieldInput1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesTransmision.observaciones,
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
              PreferencesTransmision.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class SugerenciasFieldInput2 extends StatefulWidget {
  const SugerenciasFieldInput2({Key? key}) : super(key: key);

  @override
  State<SugerenciasFieldInput2> createState() => _SugerenciasFieldInput2State();
}

class _SugerenciasFieldInput2State extends State<SugerenciasFieldInput2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesProyeccion.observaciones,
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
          PreferencesProyeccion.observaciones = value;
          setState(() {});
        }),
      ),
    );
  }
}

class SugerenciasFieldInput3 extends StatefulWidget {
  const SugerenciasFieldInput3({Key? key}) : super(key: key);

  @override
  State<SugerenciasFieldInput3> createState() => _SugerenciasFieldInput3State();
}

class _SugerenciasFieldInput3State extends State<SugerenciasFieldInput3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesCamara.observaciones,
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
          PreferencesCamara.observaciones = value;
          setState(() {});
        }),
      ),
    );
  }
}
