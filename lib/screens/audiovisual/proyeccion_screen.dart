// ignore_for_file: use_build_context_synchronously
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:intl/intl.dart';

final _myScrollController1 = ScrollController();
final _myScrollController2 = ScrollController();
final _myScrollController3 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference proyeccionCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_proyeccion');

class ProyeccionScreen extends StatefulWidget {
  const ProyeccionScreen({Key? key}) : super(key: key);

  @override
  State<ProyeccionScreen> createState() => _ProyeccionScreenState();
}

class _ProyeccionScreenState extends State<ProyeccionScreen>
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
                                image1, image2, image3, "Proyección");
                          }

                          ResetPrefsProyeccion();
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
                    "Proyección         ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 21),
                  ),
                ),
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
                        icon: Icon(Icons.monitor_outlined),
                        text: "Proyección",
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            child: Text(
                              "Recordar Orar en grupo para bendecir el servicio antes de cada Reunión",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 17),
                            ),
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
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: const [
                          //_OverView(),
                          SizedBox(height: 10),
                          Text(
                            "Protocolo de Proyección",
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
        const NameFieldInput1(),
        CheckboxListTile(
          title: const Text(
              "Encender Termica Audiovisuales y Termica Pantalla Gigante"),
          value: PreferencesProyeccion.field0,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field0 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender Luces Plataforma"),
          value: PreferencesProyeccion.field1,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field1 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender Filmadora"),
          value: PreferencesProyeccion.field10,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field10 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender PC de Proyección y Transmisión"),
          value: PreferencesProyeccion.field2,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field2 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Encender Ventilador/Caloventor"),
          value: PreferencesProyeccion.field3,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field3 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Abrir Programas"),
          value: PreferencesProyeccion.field11,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field11 = val!;
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
          title: const Text("Cargar Versiculos Predicador "),
          value: PreferencesProyeccion.field12,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field12 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Cargar Imagenes de anuncios"),
          value: PreferencesProyeccion.field13,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field13 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Cargar Canciones de la Reunion"),
          value: PreferencesProyeccion.field4,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field4 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text(
              "Definir Logo de Reunión (general, jovenes, congresos, etc)"),
          value: PreferencesProyeccion.field5,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field5 = val!;
            });
          },
        ),
        CheckboxListTile(
          title:
              const Text("Preguntar: ¿falta cargar otro material/imagenes? "),
          value: PreferencesProyeccion.field14,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field14 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Poner Musica antes de la reunión"),
          value: PreferencesProyeccion.field15,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field15 = val!;
            });
          },
        ),
        const SugerenciasFieldInput2(),
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
          title: const Text("Dejar sesión Guardada para la próxima reunión"),
          value: PreferencesProyeccion.field16,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field16 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Poner Música después de la reunión"),
          value: PreferencesProyeccion.field17,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field17 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Limpiar Mesa y piso del cuarto"),
          value: PreferencesProyeccion.field6,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field6 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar PC y monitor de Proyección "),
          value: PreferencesProyeccion.field7,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field7 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar Ventilador/Caloventor, y luz de cuarto"),
          value: PreferencesProyeccion.field8,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field8 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar Termicas y luces de la plataforma"),
          value: PreferencesProyeccion.field9,
          onChanged: (val) {
            setState(() {
              PreferencesProyeccion.field9 = val!;
            });
          },
        ),
        const AusenteNameFieldInput(),
        const TardeNameFieldInput(),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistroproyeccion = androidfirebase.FirebaseFirestore.instance
      .collection('registro_proyeccion')
      .doc();
  const String servicio = "Proyección";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesTransmision.ausentename.toString() + " ".toString(),
    'tarde': PreferencesTransmision.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesProyeccion.observaciones.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistroproyeccion.set(json);
}

_addRegistro() async {
  const String servicio = "Proyección";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesTransmision.ausentename.toString() + " ".toString(),
    'tarde': PreferencesTransmision.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesTransmision.observaciones.toString() + " ".toString(),
  };
  await proyeccionCollectionPC.add(json);
}
