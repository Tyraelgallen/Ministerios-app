import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameAnuncio extends StatefulWidget {
  const NameAnuncio({Key? key}) : super(key: key);

  @override
  State<NameAnuncio> createState() => _NameAnuncioState();
}

class _NameAnuncioState extends State<NameAnuncio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesAnuncioAudiovisual.nombre,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Nombre del Anuncio',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesAnuncioAudiovisual.nombre = value;

          setState(() {});
        }),
      ),
    );
  }
}

class FechaAnuncio extends StatefulWidget {
  const FechaAnuncio({Key? key}) : super(key: key);

  @override
  State<FechaAnuncio> createState() => _FechaAnuncioState();
}

class _FechaAnuncioState extends State<FechaAnuncio> {
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
            initialValue: PreferencesAnuncioAudiovisual.fecha,
            decoration: const InputDecoration(
              labelText: 'Fecha',
              hintText: "01/12",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesAnuncioAudiovisual.fecha = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class HoraAnuncio extends StatefulWidget {
  const HoraAnuncio({Key? key}) : super(key: key);

  @override
  State<HoraAnuncio> createState() => _HoraAnuncioState();
}

class _HoraAnuncioState extends State<HoraAnuncio> {
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
            initialValue: PreferencesAnuncioAudiovisual.horario,
            decoration: const InputDecoration(
              labelText: 'Horario',
              hintText: "20:00",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesAnuncioAudiovisual.horario = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class InfoAnuncio extends StatefulWidget {
  const InfoAnuncio({Key? key}) : super(key: key);

  @override
  State<InfoAnuncio> createState() => _InfoAnuncioState();
}

class _InfoAnuncioState extends State<InfoAnuncio> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 5,
            initialValue: PreferencesAnuncioAudiovisual.info,
            decoration: const InputDecoration(
              labelText: 'Info',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesAnuncioAudiovisual.info = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
