// ignore_for_file: use_build_context_synchronously
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets/appbar_icons_face.dart';
import 'package:intl/intl.dart';

final _myScrollController1 = ScrollController();
final _myScrollController2 = ScrollController();
final _myScrollController3 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference sonidoCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_sonido');

class SonidoScreen extends StatefulWidget {
  const SonidoScreen({Key? key}) : super(key: key);

  @override
  State<SonidoScreen> createState() => _SonidoScreenState();
}

class _SonidoScreenState extends State<SonidoScreen>
    with SingleTickerProviderStateMixin {
  bool capturing = false;

  late TabController _tabController;
  final controller = ScreenshotController();
  final isDialOpen = ValueNotifier(false);

  bool _swipeIsInProgress = false;
  bool _tapIsBeingExecuted = false;
  int _selectedIndex = 0;
  int _prevIndex = 0;

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

                          setState(() {
                            capturing = true;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(customSnackCapture2());
                          await Future.delayed(
                              const Duration(milliseconds: 600), () {});
                          _tabController.index = 0;
                          await Future.delayed(
                              const Duration(milliseconds: 400), () {});
                          final fake1 = await controller
                              .capture(); //captura de la pantalla
                          if (fake1 == null) return;
                          final image1 = await controller
                              .capture(); //captura de la pantalla
                          if (image1 == null) return;

                          _tabController.index = 1;
                          await Future.delayed(
                              const Duration(milliseconds: 400), () {});
                          final fake2 = await controller
                              .capture(); //captura de la pantalla
                          if (fake2 == null) return;
                          final image2 = await controller
                              .capture(); //captura de la pantalla
                          if (image2 == null) return;

                          _tabController.index = 2;
                          await Future.delayed(
                              const Duration(milliseconds: 400), () {});
                          final fake3 = await controller
                              .capture(); //captura de la pantalla
                          if (fake3 == null) return;
                          final image3 = await controller
                              .capture(); //captura de la pantalla
                          if (image3 == null) return;

                          setState(() {
                            capturing = false;
                          });

                          if (PreferencesApp.isPcApp == false) {
                            await saveImage(image1);
                            await saveImage(image2);
                            await saveImage(image3);
                          } else {
                            await saveWindows3(
                                image1, image2, image3, "Sonido");
                          }

                          ResetPrefsSonido();
                          if (PreferencesApp.isPcApp == false) {
                            saveAndShare3(image1, image2, image3);
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
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _tabController = TabController(length: 3, vsync: this);

    //_tabController.addListener(() {
    //setState(() {
    //_selectedIndex = _tabController.index;
    //});
    //});

    _tabController.animation?.addListener(() {
      if (!_tapIsBeingExecuted &&
          !_swipeIsInProgress &&
          (_tabController.offset >= 0.5 || _tabController.offset <= -0.5)) {
        // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered

        int newIndex = _tabController.offset > 0
            ? _tabController.index + 1
            : _tabController.index - 1;
        _swipeIsInProgress = true;
        _prevIndex = _selectedIndex;
        setState(() {
          _selectedIndex = newIndex;
        });
      } else {
        if (!_tapIsBeingExecuted &&
            _swipeIsInProgress &&
            ((_tabController.offset < 0.5 && _tabController.offset > 0) ||
                (_tabController.offset > -0.5 && _tabController.offset < 0))) {
          // detects if a swipe is being reversed. the

          _swipeIsInProgress = false;
          setState(() {
            _selectedIndex = _prevIndex;
          });
        }
      }
    });
    _tabController.addListener(() {
      _swipeIsInProgress = false;
      setState(() {
        _selectedIndex = _tabController.index;
      });
      if (_tapIsBeingExecuted == true) {
        _tapIsBeingExecuted = false;
      } else {
        if (_tabController.indexIsChanging) {
          // this is only true when the tab is changed via tap

          _tapIsBeingExecuted = true;
        }
      }
    });
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
          length: 3,
          child: AbsorbPointer(
            absorbing: capturing,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    "Sonido",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                actions: const <Widget>[
                  AppBarActions(),
                ],
                bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 5,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.start_outlined),
                        text: "Inicio",
                      ),
                      Tab(
                        icon: Icon(Icons.cable),
                        text: "Chequeos",
                      ),
                      Tab(
                        icon: Icon(Icons.exit_to_app_outlined),
                        text: "Final",
                      ),
                    ]),
                elevation: 8,
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  //---------------------
                  Scrollbar(
                    controller: _myScrollController1,
                    thickness: 8.0,
                    child: SingleChildScrollView(
                      controller: _myScrollController1,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: const [
                          //_OverView(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Protocolo de Inicio",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 21),
                          ),
                          _Formulario(),
                          SizedBox(height: 200),
                        ],
                      ),
                    ),
                  ),
                  //---------------------------------
                  Scrollbar(
                    controller: _myScrollController2,
                    thickness: 8.0,
                    child: SingleChildScrollView(
                      controller: _myScrollController2,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: const [
                          //_OverView(),
                          SizedBox(height: 10),
                          Text(
                            "Protocolo de Chequeo",
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
                  //---------------------------------
                  Scrollbar(
                    controller: _myScrollController3,
                    thickness: 8.0,
                    child: SingleChildScrollView(
                      controller: _myScrollController3,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: const [
                          //_OverView(),
                          SizedBox(height: 10),
                          Text(
                            "Protocolo Final ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 21),
                          ),
                          _Formulario3(),
                          SizedBox(height: 200),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedIndex == 2
                        ? FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () {
                              _tabController.index = 1;
                            },
                            child: const Icon(Icons.arrow_back),
                          )
                        : _selectedIndex == 1
                            ? FloatingActionButton(
                                heroTag: "btn2",
                                onPressed: () {
                                  _tabController.index = 0;
                                },
                                child: const Icon(Icons.arrow_back),
                              )
                            : const SizedBox(height: 0, width: 0),
                    //----------------------------------------------
                    _selectedIndex == 2
                        ? FloatingActionButton(
                            heroTag: "btn3",
                            onPressed: () {
                              _dialog(context);
                            },
                            child: const Icon(Icons.camera_alt),
                          )
                        : _selectedIndex == 0
                            ? FloatingActionButton(
                                heroTag: "btn4",
                                onPressed: () {
                                  _tabController.index = 1;
                                },
                                child: const Icon(Icons.arrow_forward),
                              )
                            : _selectedIndex == 1
                                ? FloatingActionButton(
                                    heroTag: "btn5",
                                    onPressed: () {
                                      _tabController.index = 2;
                                    },
                                    child: const Icon(Icons.arrow_forward),
                                  )
                                : const SizedBox(height: 0, width: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
        // hasta donde se hace el screenshot
      ),
    );
  }
}

class _Formulario extends StatefulWidget {
  const _Formulario({Key? key}) : super(key: key);

  @override
  State<_Formulario> createState() => __FormularioState();
}

class __FormularioState extends State<_Formulario> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fecha: ${PreferencesApp.dia} $_time",
          style: const TextStyle(fontSize: 17),
        ),
        const Name1Sonido(),
        const Name2Sonido(),
        const Name3Sonido(),
        CheckboxListTile(
          title: const Text("Encender Capacitores, Consola, Potencia"),
          value: PreferencesSonido.field0,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field0 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender Tablet"),
          value: PreferencesSonido.field1,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field1 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender Parlante de Retorno"),
          value: PreferencesSonido.field2,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field2 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Poner a Cargar Pilas"),
          value: PreferencesSonido.field3,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field3 = val!;
            });
          },
        ),
      ],
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
        CheckboxListTile(
          title: const Text("Chequear Micrófonos Vinchas"),
          value: PreferencesSonido.field4,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field4 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Chequear Micrófonos Manuales"),
          value: PreferencesSonido.field5,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field5 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Chequear Micrófonos Cables"),
          value: PreferencesSonido.field6,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field6 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Chequear Retornos de cada Músico"),
          value: PreferencesSonido.field7,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field7 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text(
              "Chequear Micrófonos e Instrumentos en Facebook p/pruebas Machin Lie"),
          value: PreferencesSonido.field8,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field8 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Activar salida de audio de PC audiovisual"),
          value: PreferencesSonido.field9,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field9 = val!;
            });
          },
        ),
        const SugerenciasSonido(),
      ],
    );
  }
}

class _Formulario3 extends StatefulWidget {
  const _Formulario3({Key? key}) : super(key: key);

  @override
  State<_Formulario3> createState() => __Formulario3State();
}

class __Formulario3State extends State<_Formulario3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Apagar Capacitores, Consola, Potencia"),
          value: PreferencesSonido.field10,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field10 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar Tablet y Parlante de Retorno"),
          value: PreferencesSonido.field11,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field11 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Sacar pilas a cada micrófono inalámbrico"),
          value: PreferencesSonido.field12,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field12 = val!;
            });
          },
        ),
        CheckboxListTile(
          title:
              const Text("Guardar Micrófonos Vinchas, Inalámbricos y Manuales"),
          value: PreferencesSonido.field13,
          onChanged: (val) {
            setState(() {
              PreferencesSonido.field13 = val!;
            });
          },
        ),
        const AusenteSonido(),
        const TardeSonido(),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistrosonido = androidfirebase.FirebaseFirestore.instance
      .collection('registro_sonido')
      .doc();
  const String servicio = "Sonido";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'nombre1': PreferencesSonido.nombre1.toString() + " ".toString(),
    'nombre2': PreferencesSonido.nombre2.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesSonido.ausentename.toString() + " ".toString(),
    'tarde': PreferencesSonido.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesSonido.observaciones.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistrosonido.set(json);
}

_addRegistro() async {
  const String servicio = "Sonido";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'nombre1': PreferencesSonido.nombre1.toString() + " ".toString(),
    'nombre2': PreferencesSonido.nombre2.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesSonido.ausentename.toString() + " ".toString(),
    'tarde': PreferencesSonido.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesSonido.observaciones.toString() + " ".toString(),
  };
  await sonidoCollectionPC.add(json);
}
