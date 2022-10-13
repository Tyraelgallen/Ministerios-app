// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameTutorial extends StatefulWidget {
  const NameTutorial({Key? key}) : super(key: key);

  @override
  State<NameTutorial> createState() => _NameTutorialState();
}

class _NameTutorialState extends State<NameTutorial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        initialValue: PreferencesTutorialAudiovisual.nombre,
        maxLength: 40,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Nombre del Tutorial',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          //PreferencesApp.nameanterior = PreferencesApp.name;  //WILL POP SCOPE
          PreferencesTutorialAudiovisual.nombre = value;

          setState(() {});
        }),
      ),
    );
  }
}

class LinkTutorial extends StatefulWidget {
  const LinkTutorial({Key? key}) : super(key: key);

  @override
  State<LinkTutorial> createState() => _LinkTutorialState();
}

class _LinkTutorialState extends State<LinkTutorial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesTutorialAudiovisual.link,
            decoration: const InputDecoration(
              labelText: 'Link/URL',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesTutorialAudiovisual.link = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class InfoTutorial extends StatefulWidget {
  const InfoTutorial({Key? key}) : super(key: key);

  @override
  State<InfoTutorial> createState() => _InfoTutorialState();
}

class _InfoTutorialState extends State<InfoTutorial> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 5,
            initialValue: PreferencesTutorialAudiovisual.info,
            decoration: const InputDecoration(
              labelText: 'Info',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesTutorialAudiovisual.info = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
