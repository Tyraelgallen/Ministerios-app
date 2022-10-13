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

pcfirebase.CollectionReference organizacionCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_organizacion');

class OrganizacionScreen extends StatefulWidget {
  const OrganizacionScreen({Key? key}) : super(key: key);

  @override
  State<OrganizacionScreen> createState() => _OrganizacionScreenState();
}

class _OrganizacionScreenState extends State<OrganizacionScreen>
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
                                image1, image2, image3, "Organización");
                          }

                          ResetPrefsOrganizacion();
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
        controller: controller,
        child: DefaultTabController(
          length: 3,
          child: AbsorbPointer(
            absorbing: capturing,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    "Organización         ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 5,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.menu_book),
                        text: "Tareas",
                      ),
                      Tab(
                        icon: Icon(Icons.chair_alt),
                        text: "Organización",
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
                            "Asignación de Tareas",
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
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: const [
                          //_OverView(),
                          SizedBox(height: 10),
                          Text(
                            "Protocolo de Organización",
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
      ),
      // hasta donde se hace el screenshot
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
        const TareasOrg(),
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
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: CheckboxListTile(
                title: const Text("Encendido de Luces"),
                value: PreferencesOrganizacion.field0,
                onChanged: (val) {
                  setState(() {
                    PreferencesOrganizacion.field0 = val!;
                  });
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: CheckboxListTile(
                title: const Text("Orden de sillas"),
                value: PreferencesOrganizacion.field1,
                onChanged: (val) {
                  setState(() {
                    PreferencesOrganizacion.field1 = val!;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: CheckboxListTile(
                title: const Text("Colocación de Alfolís"),
                value: PreferencesOrganizacion.field2,
                onChanged: (val) {
                  setState(() {
                    PreferencesOrganizacion.field2 = val!;
                  });
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: CheckboxListTile(
                title: const Text("Entrega de conos"),
                value: PreferencesOrganizacion.field3,
                onChanged: (val) {
                  setState(() {
                    PreferencesOrganizacion.field3 = val!;
                  });
                },
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("Desinfección de Manos y Alfombra"),
          value: PreferencesOrganizacion.field4,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field4 = val!;
            });
          },
        ),
        const AusenteOrg(),
        const TardeOrg(),
        const SugerenciasOrg(),
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
        const ConteoOrg(),
        CheckboxListTile(
          title: const Text("Cerrar puerta Belgrano"),
          value: PreferencesOrganizacion.field6,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field6 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Cerrar Puerta Oficina Pastoral"),
          value: PreferencesOrganizacion.field7,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field7 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar aire-acondicionado y ventiladores"),
          value: PreferencesOrganizacion.field8,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field8 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar Climatizador"),
          value: PreferencesOrganizacion.field9,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field9 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Apagar Luces Aulas y Escalera"),
          value: PreferencesOrganizacion.field10,
          onChanged: (val) {
            setState(() {
              PreferencesOrganizacion.field10 = val!;
            });
          },
        ),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistroOrganizacion = androidfirebase.FirebaseFirestore.instance
      .collection('registro_organizacion')
      .doc();
  const String servicio = "Organización";
  final json = {
    'servicio': servicio,
    'capitan': PreferencesOrganizacion.nombre1.toString() + " ".toString(),
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesOrganizacion.ausentename.toString() + " ".toString(),
    'tarde': PreferencesOrganizacion.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesOrganizacion.observaciones.toString() + " ".toString(),
    'datos1': PreferencesOrganizacion.nombre17.toString() + " ".toString(),
    'datos2': PreferencesOrganizacion.nombre18.toString() + " ".toString(),
    'datos3': PreferencesOrganizacion.nombre16.toString() + " ".toString(),
    'datos4': PreferencesOrganizacion.nombre15.toString() + " ".toString(),
    'datos5': PreferencesOrganizacion.nombre14.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistroOrganizacion.set(json);
}

_addRegistro() async {
  const String servicio = "Organización";
  final json = {
    'servicio': servicio,
    'capitan': PreferencesOrganizacion.nombre1.toString() + " ".toString(),
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'ausente': PreferencesOrganizacion.ausentename.toString() + " ".toString(),
    'tarde': PreferencesOrganizacion.tardename.toString() + " ".toString(),
    'observaciones':
        PreferencesOrganizacion.observaciones.toString() + " ".toString(),
    'datos1': PreferencesOrganizacion.nombre17.toString() + " ".toString(),
    'datos2': PreferencesOrganizacion.nombre18.toString() + " ".toString(),
    'datos3': PreferencesOrganizacion.nombre16.toString() + " ".toString(),
    'datos4': PreferencesOrganizacion.nombre15.toString() + " ".toString(),
    'datos5': PreferencesOrganizacion.nombre14.toString() + " ".toString(),
  };
  await organizacionCollectionPC.add(json);
}
