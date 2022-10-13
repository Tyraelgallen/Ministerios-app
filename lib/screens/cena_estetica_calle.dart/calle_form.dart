// ignore_for_file: use_build_context_synchronously
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:intl/intl.dart';

final _myScrollController1 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference calleCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_calle');

class CalleScreen extends StatefulWidget {
  const CalleScreen({Key? key}) : super(key: key);

  @override
  State<CalleScreen> createState() => _CalleScreenState();
}

class _CalleScreenState extends State<CalleScreen> {
  final controller = ScreenshotController();
  final isDialOpen = ValueNotifier(false);

  Future _dialog(context) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => AlertDialog(
              elevation: 20,
              title: const Center(child: Text("Subir Registro")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Asegurese de haber completado todos los campos y presionar este boton solo una vez por servicio.",
                  ),
                  Text("¿Desea subir el Registro Igualmente?"),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("NO")),
                    TextButton(
                        onPressed: () async {
                          if (PreferencesApp.firstLaunch == 1 ||
                              PreferencesApp.firstLaunch == 2) {
                            PreferencesApp.isPcApp == true
                                ? _addRegistro()
                                : _crearRegistro();
                          }
                          Navigator.pop(context);

                          final image1 = await controller
                              .capture(); //captura de la pantalla
                          if (image1 == null) return;

                          if (PreferencesApp.isPcApp == false) {
                            await saveImage(image1);
                          } else {
                            await saveWindows1(image1, "Encargados de Calle");
                          }

                          ResetPrefsCalle();
                          if (PreferencesApp.isPcApp == false) {
                            saveAndShare1(image1);
                          }
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          if (PreferencesApp.isPcApp == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(customSnackCaptureWindows());
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(customSnackCapture());
                          }
                        },
                        child: const Text("SI")),
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Screenshot(
        // desde donde se hace el screenshot
        controller: controller,
        child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  "Encargado de Calle      ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              bottom: const TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.car_rental),
                      text: "Encargado de Calle",
                    ),
                  ]),
              elevation: 8,
            ),
            body: TabBarView(
              children: [
                Scrollbar(
                  controller: _myScrollController1,
                  thickness: 8.0,
                  child: SingleChildScrollView(
                    controller: _myScrollController1,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: const [
                        //_OverView(),
                        SizedBox(height: 10),

                        Text(
                          "Protocolo de Encargado de Calle  ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 21),
                        ),

                        SizedBox(height: 10),
                        _Formulario2(),
                        SizedBox(height: 200),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _dialog(context);
              },
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ),
        // hasta donde se hace el screenshot
      ),
    );
  }
}

class _Formulario2 extends StatefulWidget {
  const _Formulario2({Key? key}) : super(key: key);

  @override
  State<_Formulario2> createState() => __Formulario2State();
}

class __Formulario2State extends State<_Formulario2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fecha: ${PreferencesApp.dia} $_time",
          style: const TextStyle(fontSize: 17),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Orden de vehiculos, Siempre con sonrisa y amabilidad",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
        ),
        const TareasCalle(),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistroCalle = androidfirebase.FirebaseFirestore.instance
      .collection('registro_calle')
      .doc();
  const String servicio = "Encargado de Calle";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'capitan': PreferencesCalle.nombre1.toString() + " ".toString(),
    'nombre3': PreferencesCalle.nombre3.toString() + " ".toString(),
    'nombre4': PreferencesCalle.nombre4.toString() + " ".toString(),
    'nombre5': PreferencesCalle.nombre5.toString() + " ".toString(),
    'nombre6': PreferencesCalle.nombre6.toString() + " ".toString(),
    'nombre7': PreferencesCalle.nombre7.toString() + " ".toString(),
    'nombre8': PreferencesCalle.nombre8.toString() + " ".toString(),
    'nombre9': PreferencesCalle.nombre9.toString() + " ".toString(),
    'nombre10': PreferencesCalle.nombre10.toString() + " ".toString(),
    'nombre11': PreferencesCalle.nombre11.toString() + " ".toString(),
    'nombre12': PreferencesCalle.nombre12.toString() + " ".toString(),
    'nombre13': PreferencesCalle.nombre13.toString() + " ".toString(),
    'nombre14': PreferencesCalle.nombre14.toString() + " ".toString(),
    'nombre15': PreferencesCalle.nombre15.toString() + " ".toString(),
    'nombre16': PreferencesCalle.nombre16.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistroCalle.set(json);
}

_addRegistro() async {
  const String servicio = "Encargado de Calle";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'capitan': PreferencesCalle.nombre1.toString() + " ".toString(),
    'nombre3': PreferencesCalle.nombre3.toString() + " ".toString(),
    'nombre4': PreferencesCalle.nombre4.toString() + " ".toString(),
    'nombre5': PreferencesCalle.nombre5.toString() + " ".toString(),
    'nombre6': PreferencesCalle.nombre6.toString() + " ".toString(),
    'nombre7': PreferencesCalle.nombre7.toString() + " ".toString(),
    'nombre8': PreferencesCalle.nombre8.toString() + " ".toString(),
    'nombre9': PreferencesCalle.nombre9.toString() + " ".toString(),
    'nombre10': PreferencesCalle.nombre10.toString() + " ".toString(),
    'nombre11': PreferencesCalle.nombre11.toString() + " ".toString(),
    'nombre12': PreferencesCalle.nombre12.toString() + " ".toString(),
    'nombre13': PreferencesCalle.nombre13.toString() + " ".toString(),
    'nombre14': PreferencesCalle.nombre14.toString() + " ".toString(),
    'nombre15': PreferencesCalle.nombre15.toString() + " ".toString(),
    'nombre16': PreferencesCalle.nombre16.toString() + " ".toString(),
  };
  await calleCollectionPC.add(json);
}
