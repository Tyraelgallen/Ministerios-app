import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class TareasCalle extends StatelessWidget {
  const TareasCalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name1Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name2Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name3Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name4Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name5Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name6Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name7Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name8Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name9Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name10Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name11Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name12Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name13Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name14Calle(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name15Calle(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name16Calle(),
            ),
          ],
        ),
      ],
    );
  }
}

class Name1Calle extends StatefulWidget {
  const Name1Calle({Key? key}) : super(key: key);

  @override
  State<Name1Calle> createState() => _Name1CalleState();
}

class _Name1CalleState extends State<Name1Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre1,
        maxLength: 30,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Capitán a cargo',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Calle extends StatefulWidget {
  const Name2Calle({Key? key}) : super(key: key);

  @override
  State<Name2Calle> createState() => _Name2CalleState();
}

class _Name2CalleState extends State<Name2Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
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

          labelText: 'Encargado de Calle',
          counterText: "",
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

class Name3Calle extends StatefulWidget {
  const Name3Calle({Key? key}) : super(key: key);

  @override
  State<Name3Calle> createState() => _Name3CalleState();
}

class _Name3CalleState extends State<Name3Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre3,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Vehículo',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre3 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name4Calle extends StatefulWidget {
  const Name4Calle({Key? key}) : super(key: key);

  @override
  State<Name4Calle> createState() => _Name4CalleState();
}

class _Name4CalleState extends State<Name4Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre4,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre4 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name5Calle extends StatefulWidget {
  const Name5Calle({Key? key}) : super(key: key);

  @override
  State<Name5Calle> createState() => _Name5CalleState();
}

class _Name5CalleState extends State<Name5Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre5,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Vehículo',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre5 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name6Calle extends StatefulWidget {
  const Name6Calle({Key? key}) : super(key: key);

  @override
  State<Name6Calle> createState() => _Name6CalleState();
}

class _Name6CalleState extends State<Name6Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre6,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre6 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name7Calle extends StatefulWidget {
  const Name7Calle({Key? key}) : super(key: key);

  @override
  State<Name7Calle> createState() => _Name7CalleState();
}

class _Name7CalleState extends State<Name7Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre7,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Vehículo',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre7 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name8Calle extends StatefulWidget {
  const Name8Calle({Key? key}) : super(key: key);

  @override
  State<Name8Calle> createState() => _Name8CalleState();
}

class _Name8CalleState extends State<Name8Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre8,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre8 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name9Calle extends StatefulWidget {
  const Name9Calle({Key? key}) : super(key: key);

  @override
  State<Name9Calle> createState() => _Name9CalleState();
}

class _Name9CalleState extends State<Name9Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre9,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Vehículo',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre9 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name10Calle extends StatefulWidget {
  const Name10Calle({Key? key}) : super(key: key);

  @override
  State<Name10Calle> createState() => _Name10CalleState();
}

class _Name10CalleState extends State<Name10Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre10,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre10 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name11Calle extends StatefulWidget {
  const Name11Calle({Key? key}) : super(key: key);

  @override
  State<Name11Calle> createState() => _Name11CalleState();
}

class _Name11CalleState extends State<Name11Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre11,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Moto/bicicleta',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre11 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name12Calle extends StatefulWidget {
  const Name12Calle({Key? key}) : super(key: key);

  @override
  State<Name12Calle> createState() => _Name12CalleState();
}

class _Name12CalleState extends State<Name12Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre12,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre12 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name13Calle extends StatefulWidget {
  const Name13Calle({Key? key}) : super(key: key);

  @override
  State<Name13Calle> createState() => _Name13CalleState();
}

class _Name13CalleState extends State<Name13Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre13,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Moto/bicicleta',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre13 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name14Calle extends StatefulWidget {
  const Name14Calle({Key? key}) : super(key: key);

  @override
  State<Name14Calle> createState() => _Name14CalleState();
}

class _Name14CalleState extends State<Name14Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre14,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre14 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name15Calle extends StatefulWidget {
  const Name15Calle({Key? key}) : super(key: key);

  @override
  State<Name15Calle> createState() => _Name15CalleState();
}

class _Name15CalleState extends State<Name15Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre15,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Moto/bicicleta',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre15 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name16Calle extends StatefulWidget {
  const Name16Calle({Key? key}) : super(key: key);

  @override
  State<Name16Calle> createState() => _Name16CalleState();
}

class _Name16CalleState extends State<Name16Calle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesCalle.nombre16,
        maxLength: 30,
        decoration: const InputDecoration(
          labelText: 'Conductor',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesCalle.nombre16 = value;

          setState(() {});
        }),
      ),
    );
  }
}
