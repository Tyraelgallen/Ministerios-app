import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class NuevoAnuncioFieldName extends StatefulWidget {
  const NuevoAnuncioFieldName({Key? key}) : super(key: key);

  @override
  State<NuevoAnuncioFieldName> createState() => _NuevoAnuncioFieldNameState();
}

class _NuevoAnuncioFieldNameState extends State<NuevoAnuncioFieldName> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesApp.name,
        maxLength: 40,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Nombre del Anuncio',
          counterText: "",
          icon: Icon(Icons.campaign),
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesApp.name = value;

          setState(() {});
        }),
      ),
    );
  }
}
