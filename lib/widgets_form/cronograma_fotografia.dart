import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameCronogramaFotografia extends StatefulWidget {
  const NameCronogramaFotografia({Key? key}) : super(key: key);

  @override
  State<NameCronogramaFotografia> createState() =>
      _NameCronogramaFotografiaState();
}

class _NameCronogramaFotografiaState extends State<NameCronogramaFotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesCronogramaFotografia.nombre,
        maxLength: 40,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Nombre del Evento',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesCronogramaFotografia.nombre = value;

          setState(() {});
        }),
      ),
    );
  }
}

class FechaCronogramaFotografia extends StatefulWidget {
  const FechaCronogramaFotografia({Key? key}) : super(key: key);

  @override
  State<FechaCronogramaFotografia> createState() =>
      _FechaCronogramaFotografiaState();
}

class _FechaCronogramaFotografiaState extends State<FechaCronogramaFotografia> {
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
            initialValue: PreferencesCronogramaFotografia.fecha,
            decoration: const InputDecoration(
              labelText: 'Fecha',
              hintText: "01/12",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaFotografia.fecha = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class HoraCronogramaFotografia extends StatefulWidget {
  const HoraCronogramaFotografia({Key? key}) : super(key: key);

  @override
  State<HoraCronogramaFotografia> createState() =>
      _HoraCronogramaFotografiaState();
}

class _HoraCronogramaFotografiaState extends State<HoraCronogramaFotografia> {
  final _maskFormatter =
      MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            inputFormatters: [_maskFormatter],
            keyboardType: TextInputType.datetime,
            initialValue: PreferencesCronogramaFotografia.horario,
            decoration: const InputDecoration(
              labelText: 'Horario',
              hintText: "20:00",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaFotografia.horario = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class InfoCronogramaFotografia extends StatefulWidget {
  const InfoCronogramaFotografia({Key? key}) : super(key: key);

  @override
  State<InfoCronogramaFotografia> createState() =>
      _InfoCronogramaFotografiaState();
}

class _InfoCronogramaFotografiaState extends State<InfoCronogramaFotografia> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 5,
            initialValue: PreferencesCronogramaFotografia.info,
            decoration: const InputDecoration(
              labelText: 'Info',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesCronogramaFotografia.info = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
