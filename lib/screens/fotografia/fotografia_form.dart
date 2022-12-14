// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, unused_import, prefer_interpolation_to_compose_strings

import 'package:ministerios/screens/screen_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as androidfirebase;
import 'package:firedart/firedart.dart' as pcfirebase;
import 'package:ministerios/screens/fotografia/registro_fotografia.dart';
import 'package:ministerios/screens/fotografia/registro_plataformas.dart';
import 'package:intl/intl.dart';

final _myScrollController1 = ScrollController();
final _myScrollController2 = ScrollController();
final _myScrollController3 = ScrollController();
final _fechaactual = DateTime.now();
final _time = DateFormat("dd-MM-yyyy").format(_fechaactual);

pcfirebase.CollectionReference fotografiaCollectionPC =
    pcfirebase.Firestore.instance.collection('registro_fotografia');

class FotografiaScreen extends StatefulWidget {
  const FotografiaScreen({Key? key}) : super(key: key);

  @override
  State<FotografiaScreen> createState() => _FotografiaScreenState();
}

class _FotografiaScreenState extends State<FotografiaScreen>
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
                  Text("??Desea subir el Registro Igualmente?"),
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
                            await saveWindows1(image1, "Fotograf??a");
                          }

                          ResetPrefsFotografia();
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
  void initState() {
    super.initState();
    if (PreferencesApp.firstLaunch == 3) {
      capturing = true;
    }

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
        child: AbsorbPointer(
          absorbing: capturing,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text(
                    "Fotograf??a y Plataformas   ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 5,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.camera),
                        text: "Fotograf??a",
                      ),
                      Tab(
                        icon: Icon(Icons.start_outlined),
                        text: "Cronograma",
                      ),
                      Tab(
                        icon: Icon(Icons.facebook),
                        text: "Plataformas",
                      ),
                    ]),
                elevation: 8,
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
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
                            "Protocolo de Fotograf??a",
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

                  SingleChildScrollView(
                    controller: _myScrollController1,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        (PreferencesApp.firstLaunch == 2) &
                                (PreferencesApp.isPcApp == false)
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "cronograma_fotografia");
                                    },
                                    child: const Text("Ingresar Nuevo Evento"),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        if (PreferencesApp.firstLaunch == 2) const Divider(),
                        PreferencesApp.isPcApp == true
                            ? const RegistroFotografiaPC()
                            : const RegistroFotografiaAndroid(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),

                  //---------------------------------
                  SingleChildScrollView(
                    controller: _myScrollController3,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        (PreferencesApp.firstLaunch == 2) &
                                (PreferencesApp.isPcApp == false)
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, "cronograma_plataformas");
                                    },
                                    child:
                                        const Text("Programar posts en Redes"),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        if (PreferencesApp.firstLaunch == 2) const Divider(),
                        PreferencesApp.isPcApp == true
                            ? const RegistroPlataformasPC()
                            : const RegistroPlataformasAndroid(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: PreferencesApp.firstLaunch != 3
                    ? Row(
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
                                  : _selectedIndex == 0
                                      ? FloatingActionButton(
                                          heroTag: "btn3",
                                          onPressed: () {
                                            _dialog(context);
                                          },
                                          child: const Icon(Icons.camera_alt),
                                        )
                                      : const SizedBox(height: 0, width: 0),
                          //----------------------------------------------
                          _selectedIndex == 0
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
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
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
        const NameFotografia(),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Asegurarse de enviar las Fotos dentro de las 24 horas posteriores al dia de Servicio.",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Fotos(),
      ],
    );
  }
}

Future _crearRegistro() async {
  final docRegistroFotografia = androidfirebase.FirebaseFirestore.instance
      .collection('registro_fotografia')
      .doc();
  const String servicio = "Fotografia";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'observaciones': "${PreferencesFotografia.observaciones} ",
    'nombre1': "${PreferencesFotografia.nombre1} ",
    'nombre2': "${PreferencesFotografia.nombre2} ",
    'nombre3': "${PreferencesFotografia.nombre3} ",
    'nombre5': "${PreferencesFotografia.nombre5} ",
    'nombre6': "${PreferencesFotografia.nombre6} ",
  };

  //create document and write data to Firebase
  await docRegistroFotografia.set(json);
}

_addRegistro() async {
  const String servicio = "Fotografia";
  final json = {
    'servicio': servicio,
    'nombre': PreferencesApp.name.toString() + " ".toString(),
    'dia': PreferencesApp.dia.toString() + " ".toString(),
    'fecha': _time.toString() + " ".toString(),
    'hora': DateTime.now().toString().substring(11, 16),
    'fechadecreacion': DateTime.now().toString(),
    'observaciones': "${PreferencesFotografia.observaciones} ",
    'nombre1': "${PreferencesFotografia.nombre1} ",
    'nombre2': "${PreferencesFotografia.nombre2} ",
    'nombre3': "${PreferencesFotografia.nombre3} ",
    'nombre5': "${PreferencesFotografia.nombre5} ",
    'nombre6': "${PreferencesFotografia.nombre6} ",
  };
  await fotografiaCollectionPC.add(json);
}
