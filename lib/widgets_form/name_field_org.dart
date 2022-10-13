import 'package:flutter/material.dart';
import 'package:ministerios/shared_pref/shared_pref.dart';

class ConteoOrg extends StatelessWidget {
  const ConteoOrg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.46,
              child: const Asistentes(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.46,
              child: const Colaboradores(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Ninos(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Sillas(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Sobres(),
            ),
          ],
        ),
      ],
    );
  }
}

class Sillas extends StatefulWidget {
  const Sillas({Key? key}) : super(key: key);

  @override
  State<Sillas> createState() => _SillasState();
}

class _SillasState extends State<Sillas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre14,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Sillas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre14 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Sobres extends StatefulWidget {
  const Sobres({Key? key}) : super(key: key);

  @override
  State<Sobres> createState() => _SobresState();
}

class _SobresState extends State<Sobres> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre15,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Sobres',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre15 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Ninos extends StatefulWidget {
  const Ninos({Key? key}) : super(key: key);

  @override
  State<Ninos> createState() => _NinosState();
}

class _NinosState extends State<Ninos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre16,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Niños',
          counterText: "",
          //helperText: "esc.biblica",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre16 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Asistentes extends StatefulWidget {
  const Asistentes({Key? key}) : super(key: key);

  @override
  State<Asistentes> createState() => _AsistentesState();
}

class _AsistentesState extends State<Asistentes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre17,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Asistentes Totales',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre17 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Colaboradores extends StatefulWidget {
  const Colaboradores({Key? key}) : super(key: key);

  @override
  State<Colaboradores> createState() => _ColaboradoresState();
}

class _ColaboradoresState extends State<Colaboradores> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre18,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          labelText: 'Colaboradores',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre18 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class TareasOrg extends StatelessWidget {
  const TareasOrg({Key? key}) : super(key: key);

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
              child: const Name1Org(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name2Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name3Org(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name4Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name5Org(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name6Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name7Org(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name8Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name10Org(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Name11Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Name9Org(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Name12Org(),
            ),
          ],
        ),
      ],
    );
  }
}

class Name1Org extends StatefulWidget {
  const Name1Org({Key? key}) : super(key: key);

  @override
  State<Name1Org> createState() => _Name1OrgState();
}

class _Name1OrgState extends State<Name1Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre1,
        maxLength: 20,
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
          PreferencesOrganizacion.nombre1 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name2Org extends StatefulWidget {
  const Name2Org({Key? key}) : super(key: key);

  @override
  State<Name2Org> createState() => _Name2OrgState();
}

class _Name2OrgState extends State<Name2Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
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

          labelText: 'Llenado de Planilla',
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

class Name3Org extends StatefulWidget {
  const Name3Org({Key? key}) : super(key: key);

  @override
  State<Name3Org> createState() => _Name3OrgState();
}

class _Name3OrgState extends State<Name3Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre3,
        maxLength: 20,
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
          PreferencesOrganizacion.nombre3 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name4Org extends StatefulWidget {
  const Name4Org({Key? key}) : super(key: key);

  @override
  State<Name4Org> createState() => _Name4OrgState();
}

class _Name4OrgState extends State<Name4Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre4,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Guardado de Ofrenda',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre4 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name5Org extends StatefulWidget {
  const Name5Org({Key? key}) : super(key: key);

  @override
  State<Name5Org> createState() => _Name5OrgState();
}

class _Name5OrgState extends State<Name5Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre5,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Escudera/o',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre5 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name6Org extends StatefulWidget {
  const Name6Org({Key? key}) : super(key: key);

  @override
  State<Name6Org> createState() => _Name6OrgState();
}

class _Name6OrgState extends State<Name6Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre6,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Ingreso Esquina',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre6 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name7Org extends StatefulWidget {
  const Name7Org({Key? key}) : super(key: key);

  @override
  State<Name7Org> createState() => _Name7OrgState();
}

class _Name7OrgState extends State<Name7Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre7,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Salida Belgrano',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre7 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name8Org extends StatefulWidget {
  const Name8Org({Key? key}) : super(key: key);

  @override
  State<Name8Org> createState() => _Name8OrgState();
}

class _Name8OrgState extends State<Name8Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre8,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Apagado de Luces',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre8 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name9Org extends StatefulWidget {
  const Name9Org({Key? key}) : super(key: key);

  @override
  State<Name9Org> createState() => _Name9OrgState();
}

class _Name9OrgState extends State<Name9Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre9,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Acompañamiento a Silla',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre9 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name10Org extends StatefulWidget {
  const Name10Org({Key? key}) : super(key: key);

  @override
  State<Name10Org> createState() => _Name10OrgState();
}

class _Name10OrgState extends State<Name10Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre10,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Baños Damas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre10 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name11Org extends StatefulWidget {
  const Name11Org({Key? key}) : super(key: key);

  @override
  State<Name11Org> createState() => _Name11OrgState();
}

class _Name11OrgState extends State<Name11Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre11,
        maxLength: 20,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Baños Caballeros',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre11 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name12Org extends StatefulWidget {
  const Name12Org({Key? key}) : super(key: key);

  @override
  State<Name12Org> createState() => _Name12OrgState();
}

class _Name12OrgState extends State<Name12Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre12,
        maxLength: 40,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Otros Colaboradores',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre12 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class Name13Org extends StatefulWidget {
  const Name13Org({Key? key}) : super(key: key);

  @override
  State<Name13Org> createState() => _Name13OrgState();
}

class _Name13OrgState extends State<Name13Org> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
      child: TextFormField(
        initialValue: PreferencesOrganizacion.nombre13,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),

          labelText: 'Sillas',
          counterText: "",
          //iconColor: Colors.indigo
        ),
        textCapitalization: TextCapitalization.words,
        onChanged: ((value) {
          PreferencesOrganizacion.nombre13 = value;

          setState(() {});
        }),
      ),
    );
  }
}

class SugerenciasOrg extends StatefulWidget {
  const SugerenciasOrg({Key? key}) : super(key: key);

  @override
  State<SugerenciasOrg> createState() => _SugerenciasOrgState();
}

class _SugerenciasOrgState extends State<SugerenciasOrg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesOrganizacion.observaciones,
            minLines: 1,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Observaciones',
              helperText:
                  "Mejoras posibles, problemas, soluciones, información especial",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesOrganizacion.observaciones = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class TardeOrg extends StatefulWidget {
  const TardeOrg({Key? key}) : super(key: key);

  @override
  State<TardeOrg> createState() => _TardeOrgState();
}

class _TardeOrgState extends State<TardeOrg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesOrganizacion.tardename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Tardes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesOrganizacion.tardename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}

class AusenteOrg extends StatefulWidget {
  const AusenteOrg({Key? key}) : super(key: key);

  @override
  State<AusenteOrg> createState() => _AusenteOrgState();
}

class _AusenteOrgState extends State<AusenteOrg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            initialValue: PreferencesOrganizacion.ausentename,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration(
              labelText: 'Ausentes sin aviso',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onChanged: ((value) {
              PreferencesOrganizacion.ausentename = value;
              setState(() {});
            }),
          ),
        ],
      ),
    );
  }
}
