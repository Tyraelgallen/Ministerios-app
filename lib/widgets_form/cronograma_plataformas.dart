// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameCronogramaPlataformas extends StatefulWidget {
  const NameCronogramaPlataformas({Key? key}) : super(key: key);

  @override
  State<NameCronogramaPlataformas> createState() =>
      _NameCronogramaPlataformasState();
}

class _NameCronogramaPlataformasState extends State<NameCronogramaPlataformas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesCronogramaPlataformas.nombre,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Nombre del Recordatorio',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesCronogramaPlataformas.nombre = value;

          setState(() {});
        }),
      ),
    );
  }
}

class InfoCronogramaPlataformas extends StatefulWidget {
  const InfoCronogramaPlataformas({Key? key}) : super(key: key);

  @override
  State<InfoCronogramaPlataformas> createState() =>
      _InfoCronogramaPlataformasState();
}

class _InfoCronogramaPlataformasState extends State<InfoCronogramaPlataformas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 5,
            initialValue: PreferencesCronogramaPlataformas.info,
            decoration: const InputDecoration(
              labelText: 'Información Adicional',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaPlataformas.info = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class FechaIngresoPlataformas extends StatefulWidget {
  const FechaIngresoPlataformas({Key? key}) : super(key: key);

  @override
  State<FechaIngresoPlataformas> createState() =>
      _FechaIngresoPlataformasState();
}

class _FechaIngresoPlataformasState extends State<FechaIngresoPlataformas> {
  final _maskFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            inputFormatters: [_maskFormatter],
            keyboardType: TextInputType.datetime,
            initialValue: PreferencesCronogramaPlataformas.fecha,
            decoration: const InputDecoration(
              labelText: 'Fecha de ingreso del banner',
              hintText: "01/12",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaPlataformas.fecha = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class FechaPublicacionPlataformas extends StatefulWidget {
  const FechaPublicacionPlataformas({Key? key}) : super(key: key);

  @override
  State<FechaPublicacionPlataformas> createState() =>
      _FechaPublicacionPlataformasState();
}

class _FechaPublicacionPlataformasState
    extends State<FechaPublicacionPlataformas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 10,
            initialValue: PreferencesCronogramaPlataformas.publicacion,
            decoration: const InputDecoration(
              labelText: 'Fechas de Publicación',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaPlataformas.publicacion = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
