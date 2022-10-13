import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class NameFotografia extends StatefulWidget {
  const NameFotografia({Key? key}) : super(key: key);

  @override
  State<NameFotografia> createState() => _NameFotografiaState();
}

class _NameFotografiaState extends State<NameFotografia> {
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

class SugerenciasFotografia extends StatefulWidget {
  const SugerenciasFotografia({Key? key}) : super(key: key);

  @override
  State<SugerenciasFotografia> createState() => _SugerenciasFotografiaState();
}

class _SugerenciasFotografiaState extends State<SugerenciasFotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesFotografia.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones/Sugerencias',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesFotografia.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class Fotos extends StatelessWidget {
  const Fotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name1Fotografia(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name2Fotografia(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: const Name3Fotografia(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name5Fotografia(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name6Fotografia(),
            ),
          ],
        ),
        const SugerenciasFotografia(),
      ],
    );
  }
}

class Name1Fotografia extends StatefulWidget {
  const Name1Fotografia({Key? key}) : super(key: key);

  @override
  State<Name1Fotografia> createState() => _Name1FotografiaState();
}

class _Name1FotografiaState extends State<Name1Fotografia> {
  final _maskFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        inputFormatters: [_maskFormatter],
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre1,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Fecha de servicio',

          hintText: "01/12",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Fotografia extends StatefulWidget {
  const Name2Fotografia({Key? key}) : super(key: key);

  @override
  State<Name2Fotografia> createState() => _Name2FotografiaState();
}

class _Name2FotografiaState extends State<Name2Fotografia> {
  final _maskFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        inputFormatters: [_maskFormatter],
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre2,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Fecha de envío',
          hintText: "01/12",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre2 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name3Fotografia extends StatefulWidget {
  const Name3Fotografia({Key? key}) : super(key: key);

  @override
  State<Name3Fotografia> createState() => _Name3FotografiaState();
}

class _Name3FotografiaState extends State<Name3Fotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre3,
        maxLength: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Cantidad de Fotos Tomadas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre3 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name4Fotografia extends StatefulWidget {
  const Name4Fotografia({Key? key}) : super(key: key);

  @override
  State<Name4Fotografia> createState() => _Name4FotografiaState();
}

class _Name4FotografiaState extends State<Name4Fotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre4,
        maxLength: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'N° Fotos Elegidas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre4 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name5Fotografia extends StatefulWidget {
  const Name5Fotografia({Key? key}) : super(key: key);

  @override
  State<Name5Fotografia> createState() => _Name5FotografiaState();
}

class _Name5FotografiaState extends State<Name5Fotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre5,
        maxLength: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'N° Fotos Editadas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre5 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name6Fotografia extends StatefulWidget {
  const Name6Fotografia({Key? key}) : super(key: key);

  @override
  State<Name6Fotografia> createState() => _Name6FotografiaState();
}

class _Name6FotografiaState extends State<Name6Fotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        initialValue: PreferencesFotografia.nombre6,
        maxLength: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'N° Fotos Enviadas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre6 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name7Fotografia extends StatefulWidget {
  const Name7Fotografia({Key? key}) : super(key: key);

  @override
  State<Name7Fotografia> createState() => _Name7FotografiaState();
}

class _Name7FotografiaState extends State<Name7Fotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesFotografia.nombre7,
        maxLength: 5,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: '',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesFotografia.nombre7 = value;

          setState(() {});
        }),
      ),
    );
  }
}
