// ignore_for_file: use_build_context_synchronously
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:intl/intl.dart';
import 'package:ministerios/widgets/appbar_icons_face.dart';

final _myScrollController1 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference camaraCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_camara');

class CamaraScreen extends StatefulWidget {
  const CamaraScreen({Key? key}) : super(key: key);

  @override
  State<CamaraScreen> createState() => _CamaraScreenState();
}

class _CamaraScreenState extends State<CamaraScreen> {
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
                            await saveWindows1(image1, "Filmación");
                          }

                          ResetPrefsCamara();
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
                    "Filmación",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                actions: const <Widget>[
                  AppBarActions(),
                ],
                bottom: const TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.video_camera_front_outlined),
                        text: "Filmación",
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
                            "Protocolo de Filmación  ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 21),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            child: Text(
                              "Recordar Orar en grupo para bendecir el servicio antes de cada Reunión",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 17),
                            ),
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
                heroTag: "btn1",
                onPressed: () {
                  _dialog(context);
                },
                child: const Icon(Icons.camera_alt),
              )),
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
        const NameFieldInput1(),
        CheckboxListTile(
          title: const Text("Encender Filmadora "),
          value: PreferencesCamara.field12,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field12 = val!;
            });
          },
        ),
        CheckboxListTile(
          title:
              const Text("Verificar que se encuentre en el modo Autoenfoque"),
          value: PreferencesCamara.field13,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field13 = val!;
            });
          },
        ),
        CheckboxListTile(
          title:
              const Text("Verificar que el Tripode no esté torcido/inclinado"),
          value: PreferencesCamara.field4,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field4 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text(
              "Chequear que la calidad de video en Face p/pruebas: Machin Lie "),
          value: PreferencesCamara.field5,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field5 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Notificar a Transmisión si existe algun problema"),
          value: PreferencesCamara.field14,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field14 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text(
              "Apagar Filmadora luego de que la reunion haya finalizado"),
          value: PreferencesCamara.field0,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field0 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Tapar Filmadora"),
          value: PreferencesCamara.field1,
          onChanged: (val) {
            setState(() {
              PreferencesCamara.field1 = val!;
            });
          },
        ),
        const SugerenciasFieldInput3(),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistrocamara = androidfirebase.FirebaseFirestore.instance
      .collection('registro_camara')
      .doc();
  const String servicio = "Filmación";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'observaciones':
        PreferencesCamara.observaciones.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistrocamara.set(json);
}

_addRegistro() async {
  const String servicio = "Filmación";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'observaciones':
        PreferencesTransmision.observaciones.toString() + " ".toString(),
  };
  await camaraCollectionPC.add(json);
}
