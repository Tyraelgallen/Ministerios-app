import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameContacto extends StatefulWidget {
  const NameContacto({Key? key}) : super(key: key);

  @override
  State<NameContacto> createState() => _NameContactoState();
}

class _NameContactoState extends State<NameContacto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesContacto.nombre,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: 'Nombre',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesContacto.nombre = value;
          setState(() {});
        }),
      ),
    );
  }
}

class NumeroContacto extends StatefulWidget {
  const NumeroContacto({Key? key}) : super(key: key);

  @override
  State<NumeroContacto> createState() => _NumeroContactoState();
}

class _NumeroContactoState extends State<NumeroContacto> {
  final _maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-#### ##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            inputFormatters: [_maskFormatter],
            keyboardType: TextInputType.phone,
            initialValue: PreferencesContacto.numero,
            decoration: const InputDecoration(
              labelText: 'Número de Contacto',
              hintText: "(000) 000-0000",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesContacto.numero = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class InfoContacto extends StatefulWidget {
  const InfoContacto({Key? key}) : super(key: key);

  @override
  State<InfoContacto> createState() => _InfoContactoState();
}

class _InfoContactoState extends State<InfoContacto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 5,
            initialValue: PreferencesContacto.info,
            decoration: const InputDecoration(
              labelText: 'Info',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesContacto.info = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
