// ignore_for_file: use_build_context_synchronously
import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/widgets_form/name_field_musicosadoracion.dart';
import 'package:intl/intl.dart';

final _myScrollController1 = ScrollController();
final _myScrollController2 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference musicosCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_musicos_adoracion');

class MusicosScreen extends StatefulWidget {
  const MusicosScreen({Key? key}) : super(key: key);

  @override
  State<MusicosScreen> createState() => _MusicosScreenState();
}

class _MusicosScreenState extends State<MusicosScreen>
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

                          if (PreferencesApp.isPcApp == false) {
                            await saveImage(image1);
                            await saveImage(image2);
                          } else {
                            await saveWindows2(image1, image2, "Músicos");
                          }

                          setState(() {
                            capturing = false;
                          });
                          ResetPrefsMusicos();
                          if (PreferencesApp.isPcApp == false) {
                            saveAndShare2(image1, image2);
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
    _tabController = TabController(length: 2, vsync: this);

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
          length: 2,
          child: AbsorbPointer(
            absorbing: capturing,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    "Musicos Adoracion       ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                //actions: const <Widget>[_AppBarActions()],
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
                        icon: Icon(Icons.network_check_outlined),
                        text: "Asistencia",
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
                            "Listado de Ausentes O Tardanzas",
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
                ],
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectedIndex == 1
                        ? FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () {
                              _tabController.index = 0;
                            },
                            child: const Icon(Icons.arrow_back),
                          )
                        : const SizedBox(height: 0, width: 0),
                    //----------------------------------------------
                    _selectedIndex == 1
                        ? FloatingActionButton(
                            heroTag: "btn2",
                            onPressed: () {
                              _dialog(context);
                            },
                            child: const Icon(Icons.camera_alt),
                          )
                        : _selectedIndex == 0
                            ? FloatingActionButton(
                                heroTag: "btn3",
                                onPressed: () {
                                  _tabController.index = 1;
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
        const Name1Musicos(),
        const Name2Musicos(),
        const Name3Musicos(),
        CheckboxListTile(
          title: const Text("Orden Habitación de Instrumentos"),
          value: PreferencesMusicosAdoracion.field0,
          onChanged: (val) {
            setState(() {
              PreferencesMusicosAdoracion.field0 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Orden de Batería"),
          value: PreferencesMusicosAdoracion.field1,
          onChanged: (val) {
            setState(() {
              PreferencesMusicosAdoracion.field1 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Limpiar Cabina de Batería"),
          value: PreferencesMusicosAdoracion.field2,
          onChanged: (val) {
            setState(() {
              PreferencesMusicosAdoracion.field2 = val!;
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
              "No puede arrancar ensayo o culto con suciedad en el area de servicio"),
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
        const TardeMusicosAdoracion(),
        const AusenteMusicosAdoracion(),
        CheckboxListTile(
          title: const Text("Dejar ordenada la batería y su cabina"),
          value: PreferencesMusicosAdoracion.field5,
          onChanged: (val) {
            setState(() {
              PreferencesMusicosAdoracion.field5 = val!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Dejar ordenada la Habitación de instrumentos"),
          value: PreferencesMusicosAdoracion.field6,
          onChanged: (val) {
            setState(() {
              PreferencesMusicosAdoracion.field6 = val!;
            });
          },
        ),
        const SugerenciasMusicosAdoracion(),
        const PracticaMusicosAdoracion(),
        const SizedBox(height: 100),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistrotransmision = androidfirebase.FirebaseFirestore.instance
      .collection('registro_musicos_adoracion')
      .doc();
  const String servicio = "Musicos Adoracion";
  final json = {
    'servicio': servicio,
    'nombre1': PreferencesMusicosAdoracion.nombre1.toString() + " ".toString(),
    'nombre2': PreferencesApp.name.toString() + " ".toString(),
    'nombre3': PreferencesMusicosAdoracion.nombre2.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'practica':
        PreferencesMusicosAdoracion.practica.toString() + " ".toString(),
    'observaciones':
        PreferencesMusicosAdoracion.observaciones.toString() + " ".toString(),
    'tarde': PreferencesMusicosAdoracion.tarde.toString() + " ".toString(),
    'ausente': PreferencesMusicosAdoracion.ausente.toString() + " ".toString(),
  };

  //create document and write data to Firebase
  await docRegistrotransmision.set(json);
}

_addRegistro() async {
  const String servicio = "Musicos Adoracion";
  final json = {
    'servicio': servicio,
    'nombre1': PreferencesMusicosAdoracion.nombre1.toString() + " ".toString(),
    'nombre2': PreferencesApp.name.toString() + " ".toString(),
    'nombre3': PreferencesMusicosAdoracion.nombre2.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'observaciones':
        PreferencesMusicosAdoracion.observaciones.toString() + " ".toString(),
    'practica':
        PreferencesMusicosAdoracion.practica.toString() + " ".toString(),
    'tarde': PreferencesMusicosAdoracion.tarde.toString() + " ".toString(),
    'ausente': PreferencesMusicosAdoracion.ausente.toString() + " ".toString(),
  };
  await musicosCollectionPC.add(json);
}
